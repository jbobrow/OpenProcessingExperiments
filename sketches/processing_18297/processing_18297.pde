
Rond rond1;
Rond rond2;
Rond rond3;
Rond rond4;
Rond rond5;

void setup() {

  size(600,600,P3D);
  colorMode(HSB);     
  noStroke();
  smooth();           

  rond1 = new Rond (-10, 50, 30, 20); 
  rond2 = new Rond (20, 30, -50, 15); 
  rond3 = new Rond (-30, 10, 20, 15); 
  rond4 = new Rond (10, -20, -10, 20); 
  rond5 = new Rond (25, 25, 40, 20);
}

void draw() {

  background(255);
  translate(300,300);
  rond1.action();
  rond2.action();
  rond3.action();
  rond4.action();
  rond5.action();


}


 






class Rond {

  color couleur;
  float x, y, z, taille;
  float h = random(20,45);
  float i = random(20,45);
  float j = random(20,45);
  float k = random(20,45);
  float l = random(20,45);
  float m = random(20,45);
  float n = random(20,45);
  float o = random(20,45);
  float p = random(20,45);


  Rond (float depart_x, float depart_y, float depart_z, float t) {
    x = depart_x;
    y = depart_y;
    z = depart_z;
    taille = t;
    couleur = color(random(0,200));
  }

  void action() {
    dessiner();
    pulser();
    
    
     if (mousePressed == true) {
   translate(mouseX-300,mouseY-300,0);
    
     }
  }




  void dessiner() {



 
    rotateX(mouseY * 0.005);
    rotateY(mouseX * 0.005);

    pushMatrix();

    fill(couleur);

    strokeWeight(1);
    stroke(0);
    line(0,0,0,x,y,z);
    sphere(10);


    translate(x,y,z);


    rotateX(h);
    rotateY(i);
    rotateZ(j);



    sphere(taille);

    strokeWeight(1);
    stroke(0);
    line(0,0,0,h,i,j);




    translate(h,i,j);





    sphere(random(5,10));

    strokeWeight(1);
    stroke(0);
    line(0,0,0,k,l,m);

    translate(k,l,m);

    sphere(random(5,10));



    strokeWeight(1);
    stroke(0);
    line(0,0,0,n,o,p);

    translate(n,o,p);

    sphere(random(5,10));


    popMatrix();
  }

  void pulser() {
    x += random (-3,3);
    y += random (-3,3);
    z += random (-3,3);
  }



}


