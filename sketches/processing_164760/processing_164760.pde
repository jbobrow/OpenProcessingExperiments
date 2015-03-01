
float maxR=random(45,55);
ArrayList<Hand> hands;

void setup(){
 size(800,800,P2D);
 smooth();
  //colorMode(HSB, 100);
 background(#ffffff);
 hands=new ArrayList<Hand>();
}

void draw()

{
   
    if(mousePressed) 
     //background(#ffffff);
        hands.add(new Hand(new PVector(mouseX, mouseY)));   
     
    for(int i = 0; i < hands.size(); i++) {
      
        Hand h = hands.get(i);
        if (h.isDead() == false) {
            
            
            h.drawHand();
         
            h.drawHead(new PVector(0,12),140);
            
        }
        else {
            hands.remove(i);
        }
        
    }
   
}

void reset(){
  background(#FFFFFF);
}

void keyPressed(){
 reset();
}
class Hand{
   PVector pos, vel,veld,velm,dis;
   int x,y;
   float r;
   
   
   Hand(PVector p){
    pos=p;
    vel= new PVector();
    r=maxR;
   }
   
   boolean isDead(){return r==0;}
   
   void drawHand(){
     r=r-2;
     fill(245,r*5.5,191);
     //fill(#B7AAB2);
     ellipse(pos.x,pos.y,r,r);
     
     if(r<0){r=0;}
     veld=new PVector(random(-10,10),random(-2,2));
    veld.limit(2);
    vel.add(veld);
    pos.add(vel);
   }
   
   void drawHead(PVector dis,float rH){
     dis= new PVector(0,10);
     //float rH = 100;
     //colorMode(HSB, 100);
     float cx=map(mouseX,0,width,130,210);
     //float cy=map(mouseX,0,width,173,219);
     fill(245,cx,191);
     //stroke(#aaaaaa);
     noStroke();
     pos.add(dis);
     ellipse(mouseX,mouseY,rH,rH);
     
     //eyes
     fill(#666666);
     ellipse(mouseX-40,mouseY-10,10,10);
     ellipse(mouseX+40,mouseY-10,10,10);
     
     //mouth
     fill(245,random(0,30),171);
     ellipse(mouseX,mouseY+30,30,30);
     
     fill(#ffffff);
     ellipse(mouseX,mouseY+30,20,random(5,20));
     
     // float crx=mouseX+(cos(random(0,360))*radius)+random(5);
    // loat cry=mouseY+(sin(random(0,360))*radius);
    // loat rs= random(20,40);
    // llipse(crx,cry,rs,rs);
     
  }
  
   
   
}


