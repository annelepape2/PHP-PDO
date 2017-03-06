<?php
class PersonnagesManager
{
  private $db; // Instance de PDO
  
  public function __construct($db)
  {
    $this->db = $db;
  }
  
  public function add(Personnage $perso)
  {
    $q = $this->db->prepare('INSERT INTO personnages_v2 SET nom = :nom, type = :type');
    
    $q->bindValue(':nom', $perso->nom());
    $q->bindValue(':type', $perso->type());
    
    $q->execute();
    
    $perso->hydrate(array(
      'id' => $this->db->lastInsertId(),
      'pv' => 100,
      'argent' => 0,
      'atout' => 0
    ));
  }
  
  public function count()
  {
    return $this->db->query('SELECT COUNT(*) FROM personnages_v2')->fetchColumn();
  }
  
  public function delete(Personnage $perso)
  {
    $this->db->exec('DELETE FROM personnages_v2 WHERE id = '.$perso->id());
  }
  
  public function exists($info)
  {
    if (is_int($info)) 
    {
      return (bool) $this->db->query('SELECT COUNT(*) FROM personnages_v2 WHERE id = '.$info)->fetchColumn();
    }
    

    
    $q = $this->db->prepare('SELECT COUNT(*) FROM personnages_v2 WHERE nom = :nom');
    $q->execute(array(':nom' => $info));
    
    return (bool) $q->fetchColumn();
  }
  
  public function get($info)
  {
    if (is_int($info))
    {
      $q = $this->db->query('SELECT id, nom, pv, timeEndormi, type, argent, atout FROM personnages_v2 WHERE id = '.$info);
      $perso = $q->fetch(PDO::FETCH_ASSOC);
    }
    
    else
    {
      $q = $this->db->prepare('SELECT id, nom, pv, timeEndormi, type, argent, atout FROM personnages_v2 WHERE nom = :nom');
      $q->execute(array(':nom' => $info));
      
      $perso = $q->fetch(PDO::FETCH_ASSOC);
    }
    
    switch ($perso['type'])
    {
      case 'guerrier': return new Guerrier($perso);
      case 'magicien': return new Magicien($perso);
      default: return null;
    }
  }
  
  public function getList($nom)
  {
    $persos = array();
    
    $q = $this->db->prepare('SELECT id, nom, pv, timeEndormi, type ,argent, atout FROM personnages_v2 WHERE nom <> :nom ORDER BY nom');
    $q->execute(array(':nom' => $nom));
    
    while ($donnees = $q->fetch(PDO::FETCH_ASSOC))
    {
      switch ($donnees['type'])
      {
        case 'guerrier': $persos[] = new Guerrier($donnees); break;
        case 'magicien': $persos[] = new Magicien($donnees); break;
      }
    }
    
    return $persos;
  }
  
  public function update(Personnage $perso)
  {
    $q = $this->db->prepare('UPDATE personnages_v2 SET pv = :pv, timeEndormi = :timeEndormi,argent = :argent, atout = :atout WHERE id = :id');
    
    $q->bindValue(':pv', $perso->pv(), PDO::PARAM_INT);
    $q->bindValue(':timeEndormi', $perso->timeEndormi(), PDO::PARAM_INT);
    $q->bindValue(':argent',$perso->argent(), PDO::PARAM_INT);
    $q->bindValue(':atout', $perso->atout(), PDO::PARAM_INT);
    $q->bindValue(':id', $perso->id(), PDO::PARAM_INT);
    
    $q->execute();
  }
}