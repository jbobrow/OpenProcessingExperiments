
//Fonction appellée automatiquement par notre instance de ControlP5
//(objet userInterface)
void controlEvent(ControlEvent e)
{
  if (e.controller().id() == 1)
  {
    //c'est la variable qui fait varier les connexions (variable distMinParticle)
    distMinParticle = e.controller().value();
  }
  else if (e.controller().id() == 0)
  {
    //c'est la variable qui fait varier la couleur du fond (variable colorBackground)
    colorBackground = e.controller().value();
  }
  //else if (e.controller().id() == 2)
  //{
    //colorParticle = e.controller().value();
  //}
}


