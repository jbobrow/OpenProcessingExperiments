
public class secondApplet extends PApplet {
  
  Boolean is_setup = false;
    public void setup() {
      if (!is_setup) {
	  is_setup = true;
	  size(600,600,P3D);
      }
      cam = new PeasyCam(this, 100);
      cam.setMinimumDistance(50);
      cam.setMaximumDistance(1000);
      cam.lookAt(applet2.width/2,applet2.height/2, applet2.height/2);
      activeSet = -1;
      noLoop();
    }
    public void draw() {
      hint(ENABLE_DEPTH_TEST);
      pushMatrix();
      //////////////////add label code here
      popMatrix();
      hint(DISABLE_DEPTH_TEST);
      background(255);
      pushMatrix();
      applet2.translate(applet2.width/2,applet2.height/2, applet2.height/2);
      applet2.fill (255, 0);
      applet2.box(width);
      popMatrix();
      if (activeSet != -1) {
        Sets thisSet = (Sets) sets.get(activeSet);
        for (int i = 0; i <=thisSet.objList.size()-1; i++) {
        pushMatrix();
        object hello = (object) thisSet.objList.get(i);
        hello.display();
        popMatrix();
        }
      } else {
        if (setMaster.objList.size() >= 1) {
          for (int i = 0; i <= setMaster.objList.size()-1; i++) {
          pushMatrix();
          object hello = (object) setMaster.objList.get(i);
          hello.display();
          popMatrix();
          }
        }
      }
    }
}

