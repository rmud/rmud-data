*#101
*test of .eff()~
*0 b 100
*~
*  mecho Test.
*  if !%self.eff(51)%
*    mecho Подводное дыхание.
*  end
*  if !%self.eff(19)%
*    mecho определение невидимости.
*  end
*  if !%self.eff(181)%
*    mecho Хворь.
*  end
*  if !%self.eff(4)%
*    mecho Слепота.
*  end
*  if !%self.eff(33)%
*    mecho Яд.
*  end
*  if !%self.eff(58)%
*    mecho Паралич.
*  end
*~
#102
test of makeuid~
0 c 100
запомни~
  makeuid meno %actor.id%
  global memo
~
#103
test of makeuid~
0 c 100
вспомни~
  про Я помню %memo.name_vi%.
~
#104
test of makeuid~
0 g 100
~
  mecho Вош%actor.j% %actor.name%.
  if %actor% == %memo%
    mecho Ура!
  end
~
#105
test messages~
1 c 7
проверить~
	oecho $%actor.name% проверяет сообщения. $%self.name% - это просто %self.name%, для отладки,
	oecho %self.e% просто выводит сообщения. А это просто символ \$в сообщении.
~
#106
test mobnum~
2 c 100
посчитай~
  wecho people - %people.here%, mobs - %mobs.here%, players - %players.here%
~
#107
test mobobJNUM~
1 c 7
посчитай~
  oecho people - %people.here%, mobs - %mobs.here%, players - %players.here%
  osend %actor% Вы несете %actor.inhands% предметов. %actor.inhands(91)% рукавиц.
  osend %actor% Вы несете всего  %actor.carry% предметов. %actor.carry(91)% рукавиц.
  oload obj 91
  ogive рукавицы %actor%
~
#108
test mobnum~
0 c 100
проверь~
  произнести people - %people.here%, mobs - %mobs.here%, players - %players.here%
  mtryapply %actor% 33
~

#109
test of pre-death~
0 fp 100
~
    mecho %self.name% сказал%self.k%: "Меня убил%actor.k% %actor.name%!"
    return 0
    wait 5
    mload mob %self.vnum%
    mecho Откуда ни возьмись появился еще один %self.name%
    mforce %self.name% mkill %actor.name%
    wait 5
    mload mob %self.vnum%
    mecho Откуда ни возьмись появился еще один %self.name%
    mforce %self.name% mkill %actor.name%
	wait 15
	mecho Ouh!
*    mpurge %self%
~
#110
test zoneecho~
2 c 100
зонэхо~
  wzoneecho 100 Броадкаст на зону с внумом 100!
~
* Идея - поиск команды осуществлять до проверки триггеров, тогда на момент
* проверки у нас будет найденная полная команда и это можно использовать
* в триггере, как и проверку на то, что команда найдена по сокращению.
*
*
*----------
#127
проверка-по-имени~
0 c 100
*~
  if %cmd% == этоя
    makeuid he %actor.id%
	global he
  elseif %cmd% == ктоя
    mecho Ты - %he.name%, %he.id%
	if %he.id%
	  mecho Живой
	else
	  mecho Помер
	end
  elseif %cmd% == уид
    mecho Ваш id = %actor.id%
	makeuid vvv %actor.id%
	улыб %vvv%
	mecho Имя %vvv.name%
	mecho Уровень %vvv.level%
	mecho Профессия %vvv.class%
	eval aaa %actor%
	mecho ooooooo %aaa% ooooooo
	улыб %aaa%
	mecho Имя %aaa.name%
	mecho Уровень %aaa.level%
	mecho Профессия %aaa.class%
  elseif %cmd% == найти
    eval who %arg.car%
    mecho Цель %who%
    mecho Полное имя %who.name%
    mecho Имя с точками %who.dotname%
  elseif параметры /= %cmd%
    set n 0
    while %arg.strlen% > 0
      eval p %arg.car%
      eval arg %arg.cdr%
      eval n %n% + 1
      mecho Параметр %n%: %p%
    done
    mecho Всего параметров было %n%
  elseif %cmd% == агрх
* закл доспех (код 1 по датнику) на 32 минуты
    про Агррррх!
    mapply %actor% 1 32 %actor.level% 418 50 
    mapply %actor% 1 32 %actor.level% 419 5
  else
    return 0
  end
~

*TODO:
* carq и cdrq - аналоги car и cdr, но с учётом кавычек
*
* параметры ismob, isplayer, ischar, isobj, isroom
* !комнаты ищутся
$
