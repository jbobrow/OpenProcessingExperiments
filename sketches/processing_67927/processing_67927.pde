
int x,y;
void setup(){
size(350,350); }
void draw(){
background(230);
smooth();
noFill();

stroke(0,0,255);
strokeWeight(5);
ellipse(70,70,50,50);

stroke(0);
strokeWeight(5);
ellipse(125,70,50,50);

x=int (random(355));
y=int (random(355));
            
             if((x!=180) && (y!=70)){
             stroke(255,0,0); 
             strokeWeight(5); 
             ellipse(x,y,50,50);
             }
             else{
             stroke(255,0,0); 
             strokeWeight(5);  
             ellipse(180,70,50,50);
             noLoop();  
             }
             
stroke(255,255,0);
strokeWeight(5);
ellipse(100,90,50,50);

stroke(0,255,0);
strokeWeight(5);
ellipse(155,90,50,50);
}

