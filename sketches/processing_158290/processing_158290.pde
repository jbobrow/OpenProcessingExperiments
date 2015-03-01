
boolean gameon=false; 
int gamepoint=0; 
boolean win=false; 
int level=1; 
boolean levelup=false; 
boolean start=false; 
int deadastroids=0; 
int NUMa=10; 
int MINaSPEED=1; 
int MAXaSPEED=3; 
int MAXaSIZE=30; 
int MINaSIZE=5; 
float SHIPD=20.0; 
int NUMSTARS=1000; 

Ship player; 
Astroid [] astarr= new Astroid[NUMa]; 
Star [] stars= {};

boolean TestStars( Star s, int current){ 
  if(current>0){
    for( int i=0; i< current; i++){
      if( dist (s.origin.x,s.origin.y, stars[i].origin.x, stars[i].origin.y) < (( s.diameter + stars[i].diameter )/2) ){
        return false; // if not
      }
    }
  }
 return true; //if possible  
}

void setup(){
  size(500,530);
  background(20,40,80); 
  openscreen(); 
  int m; 
  for(int i=0; i<NUMSTARS; i++){
    if(stars.length>0){
       m=stars.length;
    }else {
      m=0; 
    }
    Star x=new Star(new PVector(random(0,width), random(0,height)),random(1,5));
    while( TestStars(x , m)==false ){
      x=new Star(new PVector(random(0,width), random(0,height)),random(1,5));
    }
    stars =( Star [])append(stars, x); 
  }
  
}

void draw(){
  if(gameon==true){
    space(); 
    game();
  }
  if(start==true && player.explode==true){
    player.exploder();
    if(player.dead==true){
      gameover(); 
    }
  }
  if( gameon==true){
    score();
  } 
  if((deadastroids==NUMa || deadastroids+1==NUMa)&& win==false  ){//WIN!!!!
    win=true; 
    gameon=false; 
    println("win", level); 
    level++; 
    println("next up", level); 
    win(); 
    
  }  
  
  
}



void mousePressed(){
   if(gameon ==false&& win==true){
      gameon=true; 
      start=true; 
      win=false; 
      player= new Ship(color(255,0,0),SHIPD); 
      for(int i=0; i<astarr.length; i++){
        astarr[i] = new Astroid(random(0, width), random(0,height/4), random(MINaSPEED,MAXaSPEED), random(MINaSIZE,MAXaSIZE), color(150, 150, random(220,255))); 
      }
   }else if(gameon ==false){
      gameon=true; 
      start=true; 
      player= new Ship(color(255,0,0),SHIPD); 
      for(int i=0; i<astarr.length; i++){
        astarr[i] = new Astroid(random(0, width), random(0,height/4), random(MINaSPEED,MAXaSPEED), random(MINaSIZE,MAXaSIZE), color(150, 150, random(220,255))); 
      }
   }else {
      gameon=false; 
   } 
}




void game(){
    
    player.recal(); 
    player.display(); 
    for(int i=0; i <astarr.length ; i++){
      if(astarr[i].explode==true){
        astarr[i].exploder(); 
      }else if(astarr[i].dead==false && astarr[i].explode==false){
        astarr[i].recal(); 
        astarr[i].display(); 
        if( dist(player.origin.x, player.origin.y, astarr[i].origin.x, astarr[i].origin.y)< (player.diameter+astarr[i].diameter)/2){
           gameon=false;  
           player.explode();   
        } 
        for(int j=i+1; j<astarr.length && gameon==true && i< astarr.length-1 ; j++){
          if(astarr[j].dead==false && astarr[j].explode==false){
           if( dist(astarr[j].origin.x, astarr[j].origin.y, astarr[i].origin.x, astarr[i].origin.y)< (astarr[j].diameter+astarr[i].diameter)/2){
             astarr[i].explode(); 
             astarr[j].explode();
             gamepoint+=2; 
           }
          }
          
        }//inner for loop
      }// last else if statement 
      
    }//outer for loop 
     
    
    int count=0; 
    for(int i=0; i<astarr.length; i++){
      if(astarr[i].dead==true){
       count++;  
      }
    }
    deadastroids=count; 
    

}

void openscreen(){
  background(255); 
  textSize(40); 
  textAlign(CENTER); 
  fill(0); 
  text("Hello, there comrade!", width/2, 50); 
  textSize(30); 
  textAlign(LEFT);
  text("Be careful out there in the vast plane we call space. Move your mouse to avoid the Astroids.", width/12, 100, (2*width)/3, 400); 
  textSize(50); 
  textAlign(CENTER); 
  text("Survive!", width/2,  420);  
  textSize(12); 
  fill(255,0,0);
  text("Press the mouse to start", width/2, 470); 
}

void score(){
 fill(255,150); 
 rect(0, 500, 500, 540);
 fill(0);  
 textSize(12); 
 text("Score: "+gamepoint, 50, 520); 
 text("Number of Astroids: "+NUMa, 170, 520); 
 text("Max Speed of Astroids: "+MAXaSPEED, 330,520); 
 text("Level: "+level, 450, 520); 
}

void win(){
 background(255, 0, 0); 
 textSize(100); 
 textAlign(CENTER); 
 text("YOU WIN!!",  width/2, height/2); 
 int l=floor(random(0,3)); 
 if(l%3==0){
   NUMa=NUMa*2; 
   astarr=new Astroid[NUMa]; 
 }else if (l%3==1) {
   MAXaSPEED++;
 } else{
   MAXaSIZE--;  
 }
}

void gameover(){
 background(100,100,255); 
 fill(0); 
 textSize(100); 
 textAlign(CENTER); 
 text(" YOU DIED! ", width/2, height/2); 
 textSize(20);
 fill(0); 
 text("Your Final Score :"+gamepoint, width/2, 400); 
 text("Press the Mouse to PLAY AGAIN", width/2, 500); 
 gamepoint=0; 
 NUMa=10; 
 level=1; 
 deadastroids=0; 
 MAXaSPEED=3; 
 MAXaSIZE=30; 
 
}


void space(){
  background(20,40,80);
  for(int i=0;i<stars.length;i++){
    stars[i].draw(); 
  }
}
class Astroid{
  PVector origin; 
  float speed; 
  float diameter; 
  color acolor; 
  boolean explode; 
  int type; 
  int i; 
  boolean dead; 
  
  Astroid(float x, float y, float s,float d, color ac){
    origin= new PVector(x,y); 
    speed= s; 
    acolor= ac; 
    diameter=d; 
    explode= false; 
    type=floor(random(0,3));
    dead=false; 
    i=0; 
  }
  
  void recal(){
    float dx= (mouseX-origin.x)/abs(mouseX-origin.x); 
    float dy= (mouseY-origin.y)/abs(mouseY-origin.y); 
    origin= new PVector( origin.x+(speed*dx), origin.y+(speed*dy)); 
  }
  
  void display(){
    noStroke(); 
    fill(acolor); 
    ellipse(origin.x, origin.y,diameter, diameter ); 
    
    float j=random(1,5); 
    for(int i=0; i<j ; i++){
      fill(random(40,120)); 
      if(type==0){
      ellipse(origin.x + random(-diameter, diameter), origin.y +diameter/3, random(1, diameter/2),random(1, diameter/2)); 
      }else if(type==1){
        ellipse(origin.x + random(-diameter, diameter), origin.y , random(1, diameter/2),random(.5, diameter/2)); 
     }else {
        ellipse(origin.x + random(-diameter, diameter), origin.y -diameter/3, random(1, diameter/2),random(1, diameter/2)); 
      }
    }
    
  }
  
  void explode(){
     explode=true;  
  }
  
  
  void exploder(){ 
     noStroke(); 
     fill(acolor); 
     ellipse( origin.x-(i*5), origin.y, diameter, diameter);  
     ellipse( origin.x+(i*5), origin.y, diameter, diameter); 
     ellipse( origin.x, origin.y-(i*5), diameter, diameter); 
     ellipse( origin.x, origin.y+(i*5), diameter, diameter); 
     diameter--; 
     i++; 
     if(diameter <=0){
      explode=false; 
      dead=true; 
     } 
 }
 
 
}
class Ship{
  PVector origin;
  color scolor; 
  float diameter; 
  int i; 
  boolean dead; 
  boolean explode; 
  
  
  Ship(color sc, float d){
    origin= new PVector(width/2, height/2); 
    scolor= sc; 
    diameter=d; 
    i=0; 
    explode= false; 
    dead=false; 
  }
  
  void recal(){
     origin=new PVector( constrain(mouseX, 0, width), constrain(mouseY, 0,height-40)); 
  }
  
  void display(){
    noStroke(); 
    fill(scolor); 
    ellipseMode(CENTER); 
    //hub of ship      the all important container of player
    ellipse(origin.x, origin.y,  diameter, diameter);
    fill(0); 
    //black inner cirlce of hub
    ellipse(origin.x, origin.y, diameter-(diameter/4), diameter-(diameter/4)); 
   
    //alien
    fill(80, 255,80); 
    ellipse(origin.x, origin.y-4, 4,6); 
    fill(0); 
    ellipse(origin.x, origin.y-4, 2,3); 
    
    
    fill(scolor); 
    //lower body of ship 
    ellipse(origin.x,origin.y+5, diameter*2, diameter-(diameter/2)); 
    fill(color(random(0,255), random(0,255),random(0,255))); 
    //circle detail on the ship 
    ellipse(origin.x-(diameter/3),origin.y+5, 3, 3); 
    ellipse(origin.x,origin.y+5, 3, 3); 
    ellipse(origin.x+(diameter/3),origin.y+5, 3, 3); 
    fill(255); 
    //streams
    ellipse(origin.x-(diameter/3),origin.y+15, 2, 5); 
    ellipse(origin.x,origin.y+15, 2, 5); 
    ellipse(origin.x+(diameter/3),origin.y+15, 2, 5);
  }
  
  void explode(){
     explode=true;  
  }
  
 void exploder(){
     noStroke(); 
     fill(scolor); 
     ellipse( origin.x-(i*10), origin.y, diameter, diameter);  
     ellipse( origin.x+(i*10), origin.y, diameter, diameter); 
     ellipse( origin.x, origin.y-(i*10), diameter, diameter); 
     ellipse( origin.x, origin.y+(i*10), diameter, diameter); 
     diameter--; 
     i++; 
     if(diameter <=0){
      explode=false; 
      dead=true; 
     } 
 }
  
  
}
class Star
{
 PVector origin; 
 float diameter; 
 
 Star(PVector or, float d){
   origin= new PVector(or.x, or.y);
   diameter=d; 
 } 
  
  void draw(){
    fill(255,200); 
   ellipse(origin.x, origin.y, diameter, diameter);  
  }
  
}


