
//draft3
wdrops[] collective = new wdrops[1];
void setup () {
size(450,450);
//object initiliasation
for(int i = 0; i < collective.length; i++){
    collective[i] = new wdrops();
    collective[i].xsize = random(149,150); //randomises xsize of all wdrops
    collective[i].ysize = collective[i].xsize; //randomises ysize of all wdrops
    collective[i].xp = random(150); //randomises xp of all wdrops
    collective[i].yp = random(-10, -200); //randomises yp of all wdrops
    }
}
void draw() {
    background(0,0,139);
    
    for(int i = 0; i < collective.length; i++){
        collective[i].drawit(); //calls draw it on all wdrops
        collective[i].moveit(); //cals move it on all wdrops
    }
    
    for (int i = 0; i < 100; i++){
        ellipse(random(480),random(480),random(2),random(2));
        }
    
    noStroke();
    fill(0,100,0);
    rect(0,300,600,200);
}
class wdrops {
    
    //common variables
    
    int xp;
    int yp;
    
    float xsize;
    float ysize;
    
    int colora;
    int colorb;
    int colorc;
    
    float speed = 1;
    
    float xmotion = 1;
    float ymotion = 1;
    
    //card of presentation
    
    wdrops () {
    //wdrops (float xmotiontemp, float xsizetemp, float ysizetemp) {
        //xmotion = xmotiontemp;
        //xsize = xsizetemp;
        //ysize = ysizetemp;
        }
        
    //methods
    
    void drawit(){
        smooth();
        stroke(0,255,255);
        fill(140,255,212);
        ellipse(xp,yp,xsize,ysize);
        }
        
    void moveit(){
        
        if(xp < 500 & xp < 500){
        xp = xp + speed;
        }
        
        else if(xp >= 500|| xp>= 500){
        xp = random(10,350);
        yp = random(-20,-50);
        }
    
        if(yp < 500 & yp < 500){
        yp = yp + speed;
        }
        
        else if(yp >= 500|| yp>= 500){
        yp = random(-20,-50);
        yp = random(-20,-50);
        }
    } //end of moveit
        
        
    
} //end of class wdrops
float randomiser(float x){
    float converted = random(x);
    return converted;
    
    }

