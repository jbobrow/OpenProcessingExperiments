

 
  private Cubo cubo;
  private float rotX, rotY, rotZ;
  private float posX, posY, posZ;
  void setup() {
    size(400, 400, P3D);
    cubo = new Cubo();
    rotX = random(0.00F, 30.0F);
    rotY = random(0.00F, 30.0F);
    rotZ = random(0.00F, 30.0F);
    noSmooth();
    posX = width/2;
    posY = height/2;
    posZ = 0.00F;
  }
  void draw() {
    background(0);//(193, 150, 240, 150);
    directionalLight(204, 204, 204, 0.5F, 0, -1);
    emissive(0, 26, 51);
     
    translate(posX, posY, posZ);
    
    rotateX(radians(rotX));
    rotateY(radians(rotY));
    rotateZ(radians(rotZ));
    rotX++;
    rotY++;
    rotZ++;
    cubo.display();
  }
  class Cubo {
    private PImage[] facce;
    private String path = "";
    private float latoCubo;
    private float mezzoLatoCubo;

    public Cubo() {
      buidCubo();
    }
    private void buidCubo() {
      facce = new PImage[6];
      facce[0] = loadImage(path + "uno.jpg");
      facce[1] = loadImage(path + "due.jpg");
      facce[2] = loadImage(path + "tre.jpg");
      facce[3] = loadImage(path + "quattro.jpg");
      facce[4] = loadImage(path + "cinque.jpg");
      facce[5] = loadImage(path + "sei.jpg");
      latoCubo = facce[0].width;
      mezzoLatoCubo = latoCubo/2;
      
    }
    public void display() {
      noFill();
      box(latoCubo);
      // immagine 1 sull'asse z a +25
      pushMatrix();
      translate(0, 0, mezzoLatoCubo);
      image(facce[0],  -mezzoLatoCubo,  -mezzoLatoCubo);  
      // immagine 3
      // mi sposto sulla faccia posta di fronte
      popMatrix();// centro
      translate(0, 0, -mezzoLatoCubo);//-latoCubo);
      image(facce[2],  -mezzoLatoCubo,  -mezzoLatoCubo);  

      // immagine 5
      // mi posiziono al centro
      translate(0, 0, mezzoLatoCubo);
      rotateY(radians(90));
      translate(-mezzoLatoCubo, 0, mezzoLatoCubo);
      image(facce[4], 0,  -mezzoLatoCubo);
      // immagine 6
      // mi posiziono al centro
      translate(0, 0, -latoCubo);
      image(facce[5], 0,  -mezzoLatoCubo);
      // immagine 2
      // mi posiziono al centro
      translate(0, 0, latoCubo);
      rotateX(radians(90));
      translate(0, -mezzoLatoCubo, mezzoLatoCubo);
      image(facce[1], 0,  -mezzoLatoCubo);
      // immagine 4
      // mi posiziono al centro
      translate(0, 0, -latoCubo);
      image(facce[3], 0,  -mezzoLatoCubo);
    }
    public PImage[] getFacce() {
      return facce;
    }
    public void setFacce(PImage[] facce) {
      this.facce = facce;
    }
    
  }


