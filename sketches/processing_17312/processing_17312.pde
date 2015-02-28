
import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.math.waves.*;
import toxi.processing.*;
import toxi.physics.*;
import toxi.physics.behaviors.*;
import toxi.physics.constraints.*;
import toxi.volume.*;

class Label {
  
  String label;
  color mainColor;
  Planet parent;
  
  Label(String label, color mainColor) {
    this.label = label;
    this.mainColor = mainColor;
    this.parent = parent;
  }
  
  public void setParent(Planet parent) {
     this.parent = parent;
  }
  
  public void render() {
    fill(255, 255, 255);
    textSize(13);
    if (parent != null) {
      if (parent.beinglookedat) {
        Planet planet = ((Planet)parent);
        fill(0, 0, 0);
        fill(255, 255, 255);
        text(label, 
          planet.position.x + 10,
          planet.position.y + 10, 
          150, 
          100, 
          planet.position.z + planet.radius + 15);
      }
    }

  }
  
  public void update() {
    
  }
  
  public void run() {
    update();
    render();
  }

}

