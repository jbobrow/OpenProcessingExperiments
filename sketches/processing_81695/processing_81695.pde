

Planet planet1;
Planet planet2;
Planet planet3;
Planet planet4;

void setup() {

  size(600,600,P3D);
   
  noStroke();
  smooth();           

  planet1 = new Planet (10, 50, 30, 10); 
  planet2 = new Planet (10, 50, 30, 10); 
  planet3 = new Planet (10, -50, 30, 10); 
  planet4 = new Planet (10, -50, 30, 10); 

}

void draw() {

  background(100);
  translate(300,300);
  planet1.action();
  planet2.action();
  planet3.action();
  planet4.action();
}



class Planet {

  color cc;
  float x, y, z, branch;
  float a = random(20,85);
  float b = random(20,85);
  float c = random(20,85);
  float d = random(20,85);
  float e = random(20,85);
  float f = random(20,85);
  float g = random(20,95);
  float h = random(20,95);
  float i = random(20,95);


  Planet (float depart_x, float depart_y, float depart_z, float br) {
    x = depart_x;
    y = depart_y;
    z = depart_z;
    branch = br;
    cc = color(random(150,200),0,0);
  }

  void action() {
    graphic();


     if (mousePressed == true) {
           translate(mouseX-300,mouseY-300,0); 
     }
  }

  void graphic() {
 
    rotateX(mouseX * 0.003);
    rotateY(mouseY * 0.003);

    pushMatrix();

    fill(cc);

    strokeWeight(1.4);
    stroke(0,random(50,80));
    
    sphere(60);

    line(0,0,0,x,y,z);

//-------------------------------------
    translate(x,y,z);

    rotateX(a);
    rotateY(b);
    rotateZ(c);

    sphere(branch);

    strokeWeight(1.3);
    stroke(0,random(60,90));
    line(0,0,0,a,b,c);
//-------------------------------------
    translate(a,b,c);

    sphere(random(20,40));

    strokeWeight(1.3);
    stroke(0,random(40,80));
    line(0,0,0,d,e,f);
//-------------------------------------
    translate(d,e,f);

    sphere(random(15,20));

    strokeWeight(1.3);
    stroke(0,random(30,70));
    line(0,0,0,g,h,i);
//-------------------------------------
    translate(g,h,i);
    
    sphere(random(5,10));


    popMatrix();
  }


}


