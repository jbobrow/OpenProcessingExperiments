
Kreis[] kreise = new Kreis[2];
Vertice[] verts = new Vertice[1];
int selected;
boolean inselect = false;
boolean killingTime = false;

void setup(){
  size(800,600,P3D);
  for(int i=0;i<kreise.length;i++){
    kreise[i] = new Kreis(int(random(width)+10),int(random(height)+10),int(random(20)+10));
  }
  int countVerts = 0;
  for(int i=0;i<verts.length;i++){
    int a = int(random(kreise.length));
    int b = int(random(kreise.length));    
    while(a == b){
      b = int(random(kreise.length));    
    }
    verts[i] = new Vertice(a,b);
    countVerts++;
  }
  
  frameRate(24);
  smooth();
  
  PFont f = createFont("Verdana",18);
  textFont(f);
 }

void draw(){
  stroke(0);
  if(con_mode)
    background(190);
  else if(rename)
    background(190,200,255,120);  
  else if(killingTime){
    stroke(0,0,255);
    background(#000000);
  }    
  else
    background(90);

  netz();
  fill(0,0,255);
  text("n for new, c to connect, r to rename (leave with return), k kills",20,height-10);
}


void netz(){
  for(int i=0;i<verts.length;i++){
    verts[i].show();
  }
  for(int i=0;i<kreise.length;i++){
    if(kreise[i] == null)
      continue;
    kreise[i].show();
  }
}

void mousePressed(){
  for(int i=0;i<kreise.length;i++){
    if(kreise[i] == null)
      continue;
    Kreis tmp = kreise[i];
    kreise[i].active = false;
    if(dist(tmp.x,tmp.y,mouseX,mouseY) < tmp.radius ){
      selected = i;
      inselect = true;
      if(firstNode == -1 && con_mode){
        firstNode = i;
        kreise[i].active = true;
        println("first:"+i);
      }else{
        scndNode = i;  
        kreise[i].active = true;        
      }
    }    
  }
  if(con_mode){
    if(scndNode != -1){
      verts = (Vertice[])append(verts, new Vertice(firstNode,scndNode));
      if(firstNode > -1 & kreise[firstNode] != null)
        kreise[firstNode].active = false;      
      if(kreise[scndNode] != null)        
        kreise[scndNode].active = false;         
      firstNode = scndNode = -1;         
    }
  }
  if(killingTime == true){
    if(selected > -1 & kreise[selected] != null)  
      kreise[selected] = null;    
  }
}

void mouseDragged(){
  if(kreise[selected] == null)
    return;
  Kreis tmp = kreise[selected];
  tmp.x = mouseX;
  tmp.y = mouseY;
}

void mouseReleased(){
  inselect = false;
}

int firstNode = -1;
int scndNode = -1;

boolean con_mode = false;
boolean rename = false;

void keyPressed(){
  if(key == RETURN || key == ENTER){
    killingTime = con_mode = rename = false;
  }  
  if(rename){ // Keyboard text
    String res = "";
    if(key == BACKSPACE){
      if(kreise[selected].name.length() > 0)
        kreise[selected].name = kreise[selected].name.substring(0,kreise[selected].name.length()-1);
      return;
    }
    if (key >= 'A' && key <= 'z' || key == ' ') {    
      res += key;
    }    kreise[selected].name += res;
    print(res);
  }
  else  if(mousePressed){
    rename = false;
    return;
  }else if(key == 'n'){
    killingTime = rename = false;
    kreise = (Kreis[])append(kreise, new Kreis(mouseX,mouseY,random(20)+10));
  }else if(key == 'c'){
    killingTime = rename = false; 
    con_mode = !con_mode;
    if(!con_mode){
     firstNode = -1;
     scndNode  = -1;
     }
   }else if(key == 'r'){
    killingTime = con_mode = false; 
    rename = true;
  }else if(key == 'k'){
    killingTime = !killingTime;
    rename = con_mode = false;
  }
}

class Kreis{
  int x;
  int y;
  int radius;
  color col;
  boolean active;
  int xdir = 1;
  int ydir = 1;
  String name = "";
  
  Kreis(int x, int y, int radius){
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.col = color(random(255),random(255),random(255));
    this.active = false;
  }

  Kreis(float x, float y, float radius){
    this(int(x),int(y),int(radius));
  }
  
  void show(){
    Kreis a = this;    
    if(this.active){
      strokeWeight(5);
    }else{
      strokeWeight(1);      
    }
    
   for(int i=0;i<kreise.length;i++){
     if(kreise[i] == null)
       continue;
     Kreis b = kreise[i];
     int d = a.radius + b.radius + 90;     
     if(b == a)
       continue;
     if(dist(a.x,a.y,b.x,b.y) < d/2){
       a.x+= random(20)*xdir*random(2);
       a.y+= random(20)*ydir*random(2);     
     }
     if(a.x < 10)
       xdir = 1;
     else if(a.x > width-10)
       xdir = -1;
     if(a.y < 10)
       ydir = 1;
     else if(a.y > height-10)
       ydir = -1;
    }

    fill(125);
    ellipse(a.x,a.y,radius,radius);        
    fill(this.col,200);
    ellipse(a.x,a.y,radius*2,radius*2);    
    fill(255);
    text(name,x,y); 
  }
  
}


class Vertice{
  int va,vb;
  int ax,ay,bx,by;
  
  Vertice(int va, int vb){
    if(va == vb)
      return;
    this.va = va;
    this.vb = vb;  
  }

  Vertice(float va, float vb){
    this(int(va),int(vb));  
  }
  
  void show(){
    if(kreise[va] == null || kreise[vb] == null)
      return;
    Kreis a = kreise[va];
    Kreis b = kreise[vb];    
    int d = a.radius + b.radius + 100;
    if(dist(a.x,a.y,b.x,b.y) >= d*2){
      if(a.x >= b.x+d){
        a.x--;
        b.x++;
      }
      if(b.x > a.x+d)  
        b.x--;
      if(a.y >= b.y+d){
        a.y--;
        b.y++;
      }
      if(b.y > a.y+d)  
        b.y--;
    }
    strokeWeight(1);
    fill(0);
    line(a.x,a.y,b.x,b.y);
  }

}



