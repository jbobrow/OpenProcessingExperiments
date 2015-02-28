
class Sphere {
  float xPos = 400;      //X Position of sphere
  float yPos = 400;      //Y Position of sphere
  float zPos = 400;      //Z Position of sphere
  float radius = 80;     //Radius of the sphere
  ArrayList items = new ArrayList();
  public void Sphere() {

  }  
  public void init() {

  }
  public void update() {
    for (int i = 0; i < items.size(); i++) {
      SphereItem si = (SphereItem) items.get(i);   //Cast returned item as SphereItem Class
      si.update();
    }  
  }  
  public void render() {
    //move to the center point of the sphere
    translate(xPos, yPos, zPos);
    //mark our position in 3d space
    pushMatrix();
    //render each SphereItem
    for (int i = 0; i < items.size(); i++ ) {
      SphereItem si = (SphereItem) items.get(i);
      si.render();
    }
    //go back to our original position in 3d space
    popMatrix();
  }
  public void addSphereItem(){
    //make a new SphereItem
    SphereItem si = new SphereItem();
    //set parent
    si.parentSphere = this;
    //set random coordinate values
    si.theta = random(PI * 2);
    si.phi = random(PI * 2);
    //Add the new sphere item to the end of our ArrayList
    items.add(items.size(), si);
    si.init();
  }
}  



