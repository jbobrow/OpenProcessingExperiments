
//Kim Sipkens
//PS2 Q5 
//This is what I got done and was unable to successfully determine what //was wrong with it that is preventing it to run

Face a;

void setup() {
size(400, 400);
a = new Face();
a.display();
a.click();
}


void draw() {

}

class Face {

// left ear
int leftear_x= 140;
int leftear_y=120;
int leftear_w=60;
int leftear_h=100;

//inside of left ear
int leftear2_x= 140;
int leftear2_y=120;
int leftear2_w=20;
int leftear2_h=60;

//right ear
int rightear_x=260;
int rightear_y=120;
int rightear_w=60
int rightear_h=100;

//inside of rightear
int rightear2_x=260;
int rightear2_y=120;
int rightear2_w=20;
int rightear2_h=60;

// face
int fce_x= 200;
int fce_y=200;
int fce_w=200;
int fce_h=200;

//LEFT EYE
int eyes_x=170;
int eyes_y=170;
int eyes_w=50;
int eyes_h=50;

int eyes2_x=225;
int eyes2_y=170;
int eyes2_w=20;
int eyes2_h=20;

//left eyeball

int iball_x=170;
int iball_y=170;
int iball_w=20;
int iball_h=20;

// right eyeball
int iball2_x=225;
int iball2_y=170;
int iball2_w=20;
int iball2_h=20;

//nose
int nse_x=200;
int nse_y=210;
int nse_w=30;
int nse_h=35;


void display() {
background(255);
fill(219, 112, 147);
ellipse(leftear_x,leftear_y,leftear,leftear_h);

fill(219, 112, 147);
ellipse (leftear2_x, leftear2_y,leftear2_w, leftear2_h);

fill(219, 112, 147);
ellipse(rightear_x,rightear_y, rightear_w, rightear_h);
ellipse(rightear2_x,rightear2_y,rightear2_w, rightear2_h);

//head
fill(219, 112, 147);
ellipse( fce_x,fce_y, fce_w, fce_h);

fill(255);
ellipse(eyes_x,eyes_y, eyes_w, eyes_h);
ellipse( eyes2_x, eyes2_y, eyes2_w,eyes2_h);

fill(0);
ellipse(iball_x, iball_y, iball_w,iball_h);
ellipse( iball2_x, iball2_y,iball2_w,iball2_h);

//nose
fill(219,112,147);
ellipse( nse_x, nse_y, nse_w,nse_h);
}

void click() {
background(255);
fill(219, 112, 147);
ellipse(leftear_x,leftear_y,leftear,leftear_h);

fill(219, 112, 147);
ellipse (leftear2_x, leftear2_y,leftear2_w, leftear2_h);

fill(219, 112, 147);
ellipse(rightear_x,rightear_y, rightear_w, rightear_h);
ellipse(rightear2_x,rightear2_y,rightear2_w, rightear2_h);

//head
fill(mouseX,mouseY,60, 255);
ellipse( fce_x,fce_y, fce_w, fce_h);

fill(255);
ellipse(eyes_x,eyes_y, eyes_w, eyes_h);
ellipse( eyes2_x, eyes2_y, eyes2_w,eyes2_h);

fill(0);
ellipse(iball_x, iball_y, iball_w,iball_h);
ellipse( iball2_x, iball2_y,iball2_w,iball2_h);

//nose
fill(219,112,147);
ellipse( nse_x, nse_y, nse_w,nse_h);
}

}

void mousePressed() {
a.click();
}

void mouseDragged() {
a.click();
}
                
                
