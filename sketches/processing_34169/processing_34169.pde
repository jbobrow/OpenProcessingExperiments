
PImage bgTexture;
PImage blood;
PImage raquette;


int counter=0;

PImage[] images = new PImage[3];



int number_of_flies = 20;
int[] fly_x_pos = new int[number_of_flies];
int[] fly_y_pos = new int[number_of_flies];
int[] x_speed = new int[number_of_flies];
int[] y_speed = new int[number_of_flies];
int[] sizes = new int[number_of_flies];
boolean[] death= new boolean[number_of_flies];
boolean[] dangerZone= new boolean[number_of_flies];
int dangerArea;
boolean swatting=false;


void setup() {
  size(800, 500);
  ellipseMode(CENTER);
  for ( int i=0; i< number_of_flies; i++) {
    fly_x_pos[i] = int(random(width));
    fly_y_pos[i] = int(random(height));
    x_speed[i] = int( random(1, 5));
    y_speed[i] = int( random(1, 5));
    sizes[i] = int( random(30, 40) );
    death[i]=false;
    dangerZone[i]=false;
    dangerArea=10;

  }
    bgTexture=loadImage("background.jpg");
    blood=loadImage("blood.png");
        raquette=loadImage("raquette.png");


  for (int i=0; i<images.length; i++) {
 images[i] = loadImage(i+1+".png");
 
 }
 
 frameRate (35);


}
void draw() {
  background(255, 255, 255);
  image(bgTexture,0,0);
 




  for (int i = 0; i<number_of_flies; i++) {
    //move object



    fly_x_pos[i] += x_speed[i];
    fly_y_pos[i] += y_speed[i];

    //check if the fly is in danger
    if ((fly_x_pos[i] < mouseX + dangerArea) && (fly_x_pos[i] > mouseX - dangerArea) && (fly_y_pos[i] < mouseY+dangerArea) && (fly_y_pos[i] > mouseY-dangerArea)) {
      dangerZone[i]=true;
    }

    //check if the fly is in danger
    if ((dangerZone[i]==true ) && (swatting==true)) {
      death[i]=true;
    }
    //check the edges of the screen

    if ((fly_x_pos[i] > width-50) || (fly_x_pos[i]<-50)) {
      x_speed[i] *= -1; 
      //      temp_x_speed *= -1;
    }
    if ((fly_y_pos[i] > height) || (fly_y_pos[i]<-50)) {
      y_speed[i] *= -1;
    }

    //draw fly

    if (death[i]==false) {
      strokeWeight(1);
        
        image(images[counter],fly_x_pos[i],fly_y_pos[i],sizes[i],sizes[i]);
 counter ++;
 if (counter>2) {
 
  counter = 0;
 
 }

        //image(flyImg,fly_x_pos[i],fly_y_pos[i],sizes[i],sizes[i]);

      //rect(fly_x_pos[i], fly_y_pos[i], sizes[i], sizes[i]);
      //strokeWeight(4);
      //point(fly_x_pos[i], fly_y_pos[i]);

      x_speed[i]=round(random(1, 5)) * ((x_speed[i])/abs(x_speed[i]));
      y_speed[i]=round(random(1, 5 ))* ((y_speed[i])/abs(y_speed[i]));
    }

    if (death[i]==true) {
  image(blood,fly_x_pos[i], fly_y_pos[i], sizes[i], sizes[i]);

     // ellipse(fly_x_pos[i], fly_y_pos[i], sizes[i], sizes[i]);
      x_speed[i]=0;
      y_speed[i]=0;
    }
  }
    //Replace RECT with Image
            image(raquette,mouseX-dangerArea, mouseY-dangerArea, dangerArea*3, dangerArea*3);

 //      rect(mouseX, mouseY, dangerArea*3, dangerArea*3);
}
void mousePressed() {
  swatting=true;
}
void mouseReleased() {
  swatting=false;
}

void keyPressed() {
  
//Clear Canvas with e

if (key == 'r') {
  for ( int i=0; i< number_of_flies; i++) {
    fly_x_pos[i] = int(random(width));
    fly_y_pos[i] = int(random(height));
    x_speed[i] = int( random(1, 10));
    y_speed[i] = int( random(1, 10));
    sizes[i] = int( random(10, 30) );
    death[i]=false;
    dangerZone[i]=false;
    dangerArea=10;
  }

		}}

