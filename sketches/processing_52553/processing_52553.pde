
import saito.objloader.*;

// A wrapper for a the OBJModel object
class Object
{
  OBJModel model;
  float vel;
  float rotZ;
  
  Object(PApplet _applet, String model_name)
  {
    model = new OBJModel(_applet, model_name, "relative", TRIANGLES);
    
    model.disableDebug();
    //model.translateToCenter();
    model.disableMaterial();
    model.scale(40);
  }
}

