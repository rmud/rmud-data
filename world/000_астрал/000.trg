#1
Не брать ничего~
0 j 100~
~
  if %actor.vnum% == 0
    сказать %actor.name% Оставь %object.name_vi% себе.
  else
    mecho %self.name% отказывается брать %object.name_vi%.
  end
  return 0
~

#90
Угли берутся только в рукавицах~
1 g 100
~
  if %actor.eqvn(10)% == 91
    return 1
  else
    osend %actor% Слишком горячо!
    return 0
  end
~

$
