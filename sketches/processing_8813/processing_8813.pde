


/* author is adam schmidt
please contact me if you are going to use the code */



PFont font;
int pl = int(random(2,20));
Planet[] planets = new Planet[pl];


void setup() {
  size(1000,1000, P3D);
  stroke(0);



  for (int i = 0; i< planets.length; i++ ) {
    float x = random(1,1000);
    float y = random(1,1000);
    float z = random(1,1000);
    int xy = int (x*1);
    int yx= int (y*1);
    int zz= int ((z*1)-500);
    int co = int(random(1,255));
    int col = int(random(1,255));
    int colo = int(random(1,255));
    float dimeter = random(6,45);
    float velx1 = random(-2.5,2.5);
    float vely1 = random(-2.5,2.5);
    float velz1 = random(-2.5,2.5);
    // float vely1 = -velx1;
    if (i == planets.length-1){
      xy = width/2;
      yx = height/2;
      zz = 0;
      velz1 = 0;
      dimeter = 125;
      velx1 = 0;
      vely1 = 0;
    }

    planets[i] = new Planet(dimeter,xy,yx,zz,co,col,colo,i,velx1,vely1,velz1);
  }

}


void draw() {


  float cameraZ = ((height/2.0) / tan(PI*60.0/360.0));
 camera(width/2.0, height/2.0, (height/2) / tan(PI*60.0 / 360.0), width/2.0, height/2.0, 500, 0, 1, 0);
  perspective(mouseX/float(width)*PI/2, 1, cameraZ/10, cameraZ*10);
  float dirY = (mouseY / float(height) - 0.5) * 2;
  float dirX = (mouseX / float(width) - 0.5) * 2;
 directionalLight(222, 244, 255, -dirX, -dirY, -1);//processing.org dir light
 //ambientLight(224, 244, 255);
lightSpecular(0, 0, 0); 
  for (int i = 0; i < planets.length; i++ ) {

    planets[i].display(i);
    planets[i].update();
   // planets[i].checkEdges();




  }






}
class Planet {
  int t;
  float xcc = 0;
  float ycc = 0;
  float zcc = 0;
  float xpos;
  float ypos;
  float zpos;
  float diameter;
  int sunypos = 500;
  int sunxpos = 500;
  float gravmax = .1;
  int col1;
  int col2;
  int col3;
  int curplanet;
  int num;
  int i = 1;




  Planet(float diameter_,float xpos_,float ypos_,float zpos_,int co1,int co2,int co3,int planet,float velx,float vely,float velz) {
    diameter =  diameter_;
    xpos = (xpos_);
    ypos = (ypos_);
    zpos = (zpos_);
    col1 = co1;
    col2 =co2;
    col3 =co3;
    curplanet = planet;
    xcc = velx;
    ycc= vely;
    zcc = velz;
  }

  void update() {

    // float area = (((diameter/2)*(diameter/2))*3.1415);

    for (int i = 0;i < planets.length; i++) {
      if(i == curplanet){
        continue;
      }
      if(planets.length-1 ==curplanet){
        continue;
      }
      float area1 = ((((planets[i].diameter/2))*(planets[i].diameter/2)*(planets[i].diameter/2))*3.1415);
      float disty = (planets[i].ypos-ypos);
      float distx = (planets[i].xpos-xpos);
      float distz = (planets[i].zpos-zpos);
      float distfull = sqrt((distz*distz)+(distx*distx+disty*disty));
      if (distfull < (planets[i].diameter/2)){
        continue;
      }
      float acc = (.01) *(area1/(distfull*distfull));
      // print(" dist x="+distx);
      // print(" dist y="+disty);
      // print(" full="+distfull);
      // println(" acc="+acc);
      //.0000000000667*distx
      zcc = zcc +  (acc*distz/distfull);
      xcc = xcc +  (acc*distx/distfull); 
      ycc = ycc +  (acc*disty/distfull);
    }
    zpos = zpos + zcc;
    xpos = xpos + xcc;
    ypos = ypos + ycc;

    /*if(curplanet== 0 && xpos < 625 && xpos > 375 && ypos < 625 && ypos > 375){
     
     background(255);
     fill (0);
     font = loadFont("BookAntiqua-Bold-150.vlw");
     textFont(font);
     text("THE END", 150, 500);
     delay(10000);
     if(1==1){
     exit();
     }
     
     }
     if(curplanet== 0 && xpos < 50 && xpos > 50 && ypos < 50 && ypos > 50){
     
     background(255);
     fill (0);
     font = loadFont("BookAntiqua-Bold-150.vlw");
     textFont(font);
     text("WIN", 150, 500);
     delay(10000);
     if(1==1){
     exit();
     }
     
     }*/


  }
 /* void checkEdges() {

    if (xpos > width -(diameter/2)) {
      xcc = -xcc;
    } 
    else if (xpos < diameter/2) {
      xcc = -xcc;
    }

    if (ypos > height - (diameter/2)) {
      ycc = -ycc;
    } 
    else if (ypos < diameter/2 ) {
      ycc = -ycc;
    }


  }*/

  void display(int ti) {
    t = ti+1;


    stroke(0);
    // print(" ycc" +ycc);
    // println(" xcc" +xcc);
    // println(diameter+"diam");

    if(curplanet == i){
      fill(0,0,0,10);

         background(0);


    }


    if(curplanet != 0){
      fill(col1,col2,col3);
    }
    else{
      fill(255,255,255);
    }
    if(curplanet == planets.length -1){
      fill(255,255,0,233);

      

    }
    //ellipse(int(xpos),int(ypos),diameter,diameter);

    noStroke();
            pushMatrix();
    translate(xpos, ypos, zpos);

    sphere(diameter);

        popMatrix();



  }





}
void stop()
{
  // Do stuff
  // ...
  super.stop();
}




