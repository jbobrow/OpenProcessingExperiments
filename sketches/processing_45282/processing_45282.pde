
//Fonction appellée automatiquement par notre instance de ControlP5
//(objet userInterface)
void controlEvent(ControlEvent e)
{
  if (e.controller().id() == 1)
  {
    //c'est la variable qui fait varier la taille des lignes (variable sizeLine)
    sizeLine = e.controller().value();
  }
  else if (e.controller().id() == 0)
  graisse = e.controller().value();
}



