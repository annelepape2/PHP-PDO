<?php
class Magicien extends Personnage
{
  public function lancerUnSort(Personnage $perso)
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
    
    if ($perso->id == $this->id)
    {
      return self::CEST_MOI;
    }
    
    if ($this->atout == 0)
    {
      return self::PAS_DE_MAGIE;
    }
    
    if ($this->estEndormi())
    {
      return self::PERSO_ENDORMI;
    }
    
    $perso->timeEndormi = time() + ($this->atout * 6) * 3600;
    
    return self::PERSONNAGE_ENSORCELE;
  }
}