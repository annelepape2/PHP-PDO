<?php
class Guerrier extends Personnage
{
  public function perdrepv($force)
  {
    if ($this->pv >= 0 && $this->pv <= 25)
    {
      $this->atout = 4;
    }
    elseif ($this->pv > 25 && $this->pv <= 50)
    {
      $this->atout = 3;
    }
    elseif ($this->pv > 50 && $this->pv <= 75)
    {
      $this->atout = 2;
    }
    elseif ($this->pv > 50 && $this->pv <= 90)
    {
      $this->atout = 1;
    }
    else
    {
      $this->atout = 0;
    }
    
    $this->pv += 5 - $this->atout;
    
    // Si on a 100 de dégâts ou plus, on supprime le personnage de la BDD.
    if ($this->pv >= 100)
    {
      return self::PERSONNAGE_TUE;
    }
    
    // Sinon, on se contente de mettre à jour les dégâts du personnage.
    return self::PERSONNAGE_FRAPPE;
  }
}