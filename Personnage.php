<?php
abstract class Personnage
{
  protected $atout,
            $pv,
            $id,
            $nom,
            $argent,
            $timeEndormi,
            $type;
  
  const CEST_MOI = 1; 
  const PERSONNAGE_TUE = 2; 
  const PERSONNAGE_FRAPPE = 3; 
  const PERSONNAGE_ENSORCELE = 4; 
  const PAS_DE_MAGIE = 5; 
  const PERSO_ENDORMI = 6; 
  
  public function __construct(array $donnees)
  {
    $this->hydrate($donnees);
    $this->type = strtolower(get_class($this));
  }
  
  public function estEndormi()
  {
    return $this->timeEndormi > time();
  }
  
  public function frapper(Personnage $perso)
  {
    if ($perso->id == $this->id)
    {
      return self::PERSONNAGE_FRAPPE;
    }
    
    if ($this->estEndormi())
    {
      return self::PERSO_ENDORMI;
    }
    
    
    return $perso->perdrepv($this->pv() - 5);
     return $this->perdrepv($this->pv() - 5);
  }
  
  public function hydrate(array $donnees)
  {
    foreach ($donnees as $key => $value)
    {
      $method = 'set'.ucfirst($key);
      
      if (method_exists($this, $method))
      {
        $this->$method($value);
      }
    }
  }
   public function ennemiefrappe(){
    $this->pv -= 5;
  }
    public function gagnerargent(){
    $this->argent += 1;
      $this->pv -= 5;
  }
 
  
  public function nomValide()
  {
    return !empty($this->nom);
  }
  
  public function perdrepv($force)
  {
    $this->pv -= 5;
    
    // Si on a 100 de dégâts ou plus, on supprime le personnage de la BDD.
    if ($this->pv <= 0)
    {
      return self::PERSONNAGE_TUE;
    }
    
    // Sinon, on se contente de mettre à jour les dégâts du personnage.
    return self::PERSONNAGE_FRAPPE;
  }
  
  public function reveil()
  {
    $secondes = $this->timeEndormi;
    $secondes -= time();
    
    $heures = floor($secondes / 3600);
    $secondes -= $heures * 3600;
    $minutes = floor($secondes / 60);
    $secondes -= $minutes * 60;
    
    $heures .= $heures <= 1 ? ' heure' : ' heures';
    $minutes .= $minutes <= 1 ? ' minute' : ' minutes';
    $secondes .= $secondes <= 1 ? ' seconde' : ' secondes';
    
    return $heures . ', ' . $minutes . ' et ' . $secondes;
  }
  
  public function atout()
  {
    return $this->atout;
  }
  
  public function pv()
  {
    return $this->pv;
  }
  
  public function id()
  {
    return $this->id;
  }
  
  public function nom()
  {
    return $this->nom;
  }
   public function argent(){
    return $this->argent;
  }
  
  public function timeEndormi()
  {
    return $this->timeEndormi;
  }
  
  public function type()
  {
    return $this->type;
  }
  
  public function setAtout($atout)
  {
    $atout = (int) $atout;
    
    if ($atout >= 0 && $atout <= 100)
    {
      $this->atout = $atout;
    }
  }
  
  public function setpv($pv)
  {
    $pv = (int) $pv;
    
    if ($pv >= 0 && $pv <= 100)
    {
      $this->pv = $pv;
    }
  }
  
  public function setId($id)
  {
    $id = (int) $id;
    
    if ($id > 0)
    {
      $this->id = $id;
    }
  }
  
  public function setNom($nom)
  {
    if (is_string($nom))
    {
      $this->nom = $nom;
    }
  }
  public function setargent($argent)
  {
    $argent = (int) $argent;
    if ($argent >= 0 && $argent <= 100) {
      $this->argent = $argent;
    }
  }
  
  public function setTimeEndormi($time)
  {
    $this->timeEndormi = (int) $time;
  }
}