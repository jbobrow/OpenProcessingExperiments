
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
FFT fft;

Minim minim;
AudioOutput out;
SineWave sine;

vis Vis;

boolean button1;
boolean button2;
boolean button3;
boolean button4;
int button;
int idinc;

ArrayList<node> nodes;
ArrayList<link> links;
//int waves = new int[0];

void setup(){
  frameRate(24);
size(800,600);
noStroke();

minim = new Minim(this);
out = minim.getLineOut(Minim.STEREO);
sine = new SineWave(440,.5,out.sampleRate());
Vis = new vis();
fft = new FFT(out.bufferSize(), out.sampleRate());

button1 = button2 = button3 = button4 = false;
button = 0;
nodes = new ArrayList<node>();
links = new ArrayList<link>();
idinc = 0;
}

void draw(){
  background(255);
  fill(232,71,73);
  rect(0, height - 20, width/4, 20);
  fill(147,201,71);
  rect(width/4, height - 20, width/4, 20);
  fill(87,189,172);
  rect(width/2, height - 20, width/4, 20);
  fill(242,98,58);
  rect(width/4 * 3, height - 20, width/4, 20);
    
  fill(255,255,255,100);
  ellipse(100,height-10,15,15);
  rectMode(CENTER);
  pushMatrix(); translate(300,height-10);
  rect(0,0,15,15);
  popMatrix();
  beginShape();
  vertex(500-7,height-17);
  vertex(500+7,height-17);
  vertex(500, height - 3);
  endShape();
  beginShape();
    vertex(697,height-17.5);
    vertex(703,height-17.5);
    vertex(703,height-13);
    vertex(707.5,height-13);
    vertex(707.5,height-7);
    vertex(703, height - 7);
    vertex(703, height-2.5);
    vertex(697,height-2.5);
    vertex(697, height-7);
    vertex(692.5, height-7);
    vertex(692.5, height-13);
    vertex(697, height - 13);
  endShape();
   
  rectMode(CORNER);
  
  mouseCheck();
  
  if(overButton(0,0,width,height-20) && button != 0)
  {
    if(button == 1)
    {
      fill(232,71,73);
      ellipseMode(CENTER);
      ellipse(mouseX,mouseY,10,10);
    }
    if(button == 2)
    {
     fill(147,201,71);
     rectMode(CENTER);
     rect(mouseX,mouseY,10,10);
     rectMode(CORNER);
    }
    if(button == 3)
    {
      fill(87,189,172);
      beginShape();
      vertex(mouseX, mouseY - 7);
      vertex(mouseX - 4, mouseY);
      vertex(mouseX + 4, mouseY);
      endShape();
    }
    if(button == 4){
     rectMode(CENTER);
     fill(242,98,58);
     rect(mouseX,mouseY, 5,15);
     rect(mouseX,mouseY,15,5);
     rectMode(CORNER); 
    }
  }
    Vis.drawv();
  
  updateNodes();
  moveNodes();
  updateLinks();
    drawLinks();
  drawNodes();


}


void drawNodes(){
  for(node N : nodes)
  {
    N.drawN();
  }
}

void updateNodes(){
  for(node N : nodes)
  {
    N.updateN();
  }
}

void moveNodes(){
  for(node N : nodes)
  {
    N.moveN();
  }
  for(int i = 0; i < nodes.size(); i++)
  {
    for(int j = 0; j < nodes.size(); j++)
    {
      //do not compare a node to itself
      if(i != j)
      {
        node temp = nodes.get(i);
        node temp2 = nodes.get(j);
      
        //if two nodes are within 5 pixels of each other
        if(temp.loc.dist(temp2.loc) < 5)
        {
         //remove nodes from the array.
         nodes.remove(i);
         nodes.remove(j-1);
         i--;
         j--;
        }
      }
    }
  }
}

void drawLinks(){
  for(link L: links)
  {
    L.drawLink();
  }
}

void updateLinks(){
  for(link L : links)
  {
    L.updateLink();
  }
  
  //check for dead links
  for(int i = 0; i < links.size(); i++)
  {
    link temp = links.get(i);
    if(temp.dead == true)
    {
      links.remove(i);
    }
  }
}

void mouseCheck(){
  if(overButton(0, height - 20, width/4, 20) && mousePressed)
  {
    button = 1;
    button1 = true;
    button2 = false;
    button3 = false;
    button4 = false;
  }
  if(overButton(width/4, height - 20, width/4, 20) && mousePressed)
  {
    button = 2;
    button1 = false;
    button2 = true;
    button3 = false;
    button4 = false;
  }
  if(overButton(width/2, height - 20, width/4, 20) && mousePressed)
  {
    button = 3;
    button1 = false;
    button2 = false;
    button3 = true;
    button4 = false;
  }
  if(overButton(width/4 * 3, height - 20, width/4, 20) && mousePressed)
  {
    button = 4;
    button1 = false;
    button2 = false;
    button3 = false;
    button4 = true;
  }
  if(overButton(0,0, width, height - 20) && mousePressed && button != 0)
  {
    nodes.add(new node(button,mouseX,mouseY,idinc));
    idinc++;
    button = 0;
  }
}

boolean overButton(int ORx, int ORy, int ORw, int ORh)
{
  if(mouseX > ORx && mouseX < ORx + ORw && mouseY > ORy && mouseY < ORy + ORh)
  {
    return true;
  }else{
    return false;
  }
}

void stop()
{
  out.close();
  minim.stop();
  
  super.stop();
}

class link{
 
 PVector node1;
 PVector node2;
 int node1type;
 int node2type;
 int node1id;
 int node2id;
 boolean dead;
 boolean matched1;
 boolean matched2;
float linkLength;

float dist;
float freq;
float pan;
 
 SineWave sine;
 PulseWave pul;
 SawWave saw;
 SineWave sqr;
 SquareWave sqr2;
 
 link(PVector in1, int in1type, int inid1, PVector in2, int in2type, int inid2){
   
   dead = false;
   matched1 = false;
   matched2 = false;
   
   node1 = new PVector();
   node2 = new PVector();
   
   node1.x = in1.x;
   node1.y = in1.y;
   node2.x = in2.x;
   node2.y = in2.y;
   
   node1type = in1type;
   node2type = in2type;
   
   node1id = inid1;
   node2id = inid2;
   
   sine = new SineWave(440, 0.5, out.sampleRate());
   pul = new PulseWave(220, 0.1, out.sampleRate());
   saw = new SawWave(440,0.1,out.sampleRate());
   sqr = new SineWave(50, 0.05, out.sampleRate());
   sqr.portamento(200);
   pul.portamento(100);
   
   linkLength = 0;//inLength;
   
   if(node1type == 1 || node2type == 1) out.addSignal(sine);
   if(node1type == 2 || node2type == 2) out.addSignal(pul);
   if(node1type == 3 || node2type == 3) out.addSignal(saw);
   if(node1type == 4 || node2type == 4) 
   {
     out.addSignal(sqr);
   }

 } 
 
 void drawLink(){
   stroke(255,205,0);
   strokeWeight(5/(dist/10));
   line(node1.x, node1.y, node2.x, node2.y);
   strokeWeight(1);
   noStroke();
 }
 
 void updateLink()
 {
   dist = node1.dist(node2);
   freq = map(dist, 0 ,100, random(1500,1500),random(60,60));
   pan = map(dist, 0, 100, -1, 1);
   sqr.setFreq(freq*.5);
   
   freq = freq + random(-100,100);
   float w = map(dist, 0, height, 10, 20);
   pul.setPulseWidth(w);

   pul.setFreq(freq);
      pul.setPan(pan);
   sine.setFreq(freq);
   sine.setPan(pan);
   saw.setFreq(freq*.5);
   saw.setPan(pan);

   
   //if this link is shorter than 5, it should be deleted
   if(dist < 5)
   {
     //loops through links
    for(int i = 0; i < links.size(); i++)
    {
      
      link temp = links.get(i);
      
      //finds itself
      if(temp.node1id == node1id && temp.node2id == node2id)
      {
        //removes sound and sets it to dead
        if(node1type == 1 || node2type == 1) out.removeSignal(sine);
        if(node1type == 2 || node2type == 2) out.removeSignal(pul);
        if(node1type == 3 || node2type == 3) out.removeSignal(saw);
        if(node1type == 4 || node2type == 4) 
        {
          out.removeSignal(sqr);
        }
        dead = true;
      }
    }
   }
   else if(dist > 100)
   {
     //loops through links
    for(int i = 0; i < links.size(); i++)
    {
      
      link temp = links.get(i);
      
      //finds itself
      if(temp.node1id == node1id && temp.node2id == node2id)
      {
        //removes sound and sets it to dead
        if(node1type == 1 || node2type == 1) out.removeSignal(sine);
        if(node1type == 2 || node2type == 2) out.removeSignal(pul);
        if(node1type == 3 || node2type == 3) out.removeSignal(saw);
        if(node2type == 4 || node2type == 4) 
        {
          out.removeSignal(sqr);
        }
        dead = true;
      }
    }
   }
 }
 
 void unSound(){
   out.removeSignal(sine);
   out.disableSignal(sine);
   out.clearSignals();
 }
  
}
class node{
  
  PVector loc;
  PVector vel;
  PVector steer;
  PVector up;
  int typeN;
  boolean linked;
  int id;
  
  node(int type, int x, int y, int idin)
  {
    loc = new PVector(x,y);
    loc.x = x;
    loc.y = y;
    typeN = type;
    linked = false;
    id = idin;
    vel = new PVector(random(-1,1),random(-1,1));
    steer = new PVector(0,0);
    up = new PVector(0,1);
  }
  
  void drawN()
  {
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(loc.heading());
    if(typeN == 1)
    {
      fill(232,71,73);
      ellipse(0, 0, 20, 20);
    }
    if(typeN == 2)
    {
      fill(147,201,71);
      rectMode(CENTER);
      rect(0, 0, 20,20);
      rectMode(CORNER);
    }
    if(typeN == 3)
    {
      fill(87,189,172);
      beginShape();
      vertex(0, 0 - 9);
      vertex(0 - 9, 0 + 9);
      vertex(0 + 9, 0 + 9);
      endShape();
    }
    if(typeN == 4)
    {
      fill(242,98,58);
      rectMode(CENTER);
      rect(0, 0, 8, 20);
      rect(0, 0, 20, 8);
      rectMode(CORNER);
    }
    popMatrix();
  }
  
  void updateN(){
    for(node N: nodes){
      if( loc.dist(N.loc) < 100 && loc.dist(N.loc) >= 5)
      {
        for(link L: links)
        {
          if(id == L.node1id && N.id == L.node2id)
          {
            L.dead = false;
            linked = true;
            L.node1 = loc;
            L.node2 = N.loc;
          }
        }
        if(linked == false) links.add(new link(loc,typeN,id,N.loc, N.typeN, N.id));
      }
    }
  }
  
  void moveN()
  {
    for(node N : nodes)
    {
      float dist = loc.dist(N.loc);
      if(dist < 100)
      {
          steer.x += (N.loc.x - loc.x);
          steer.y += (N.loc.y - loc.y);
      }
      steer.normalize();
    }
    vel.add(steer);
    steer.x = 0;
    steer.y = 0;
    loc.add(vel);
    if(loc.y > height - 20) loc.y = 0;
    if(loc.y < 0) loc.y = height - 20;
    if(loc.x > width) loc.x = 0;
    if(loc.x < 0) loc.x = width;
  }
  
}
class vis{

vis(){
  
}

void drawv(){
  
  for(link L : links)
  {
    if((L.node1type == 4 || L.node2type == 4))
     {
       float remap = map(L.freq, 0, 500, 100, 0);
       pushMatrix();
         stroke(242, 98, 58);
         fill(0,0,0,0);
         if(remap/10 < 0) remap = remap*(-1);
         strokeWeight(remap/10);
       
         ellipse(width/2,height/2, remap, remap);

         stroke(242,98,58,80);
         ellipse(width/2,height/2, remap-10, remap-10);

         stroke(242,98,58,60);
         ellipse(width/2,height/2, remap-10, remap-10);

         stroke(242,98,58,40);
         ellipse(width/2,height/2, remap-10, remap-10);

         stroke(242,98,58,20);
         ellipse(width/2,height/2, remap-10, remap-10);
       
         strokeWeight(0);
         noStroke();
       popMatrix();
     }
    if(L.node1type == 1 || L.node2type == 1)
    {
      stroke(255,0,0,50);
      fill(0,0,0,0);
      for(int i = 0; i < L.freq * .1 ; i+=3)
        {
          ellipse(width/2,height/2,i*2,i*2);
        }
        noStroke();
     }
     
     if(L.node1type == 2 || L.node2type == 2)
     {
      stroke(147,201,71,100);
      fill(0,0,0,0);
      strokeWeight(5);
      for(int i = 0; i < L.freq * .1; i += 30)
      {
        rectMode(CENTER);
        pushMatrix(); translate(width/2,height/ 8 * 3); rotate(PI/4); rect(0, 0, i * .6, i * .6); popMatrix();
        pushMatrix(); translate(width/2,height/ 8 * 5); rotate(PI/4); rect(0, 0, i * .6, i * .6); popMatrix();
        if(i > 30)
        {
          pushMatrix(); translate(width/2, height/ 8 * 2); rotate(PI/4); rect(0, 0, (i - 30) * .6, (i - 30) * .6); popMatrix();
          pushMatrix(); translate(width/2, height/ 8 * 6); rotate(PI/4); rect(0, 0, (i - 30) * .6, (i - 30) * .6); popMatrix();
        }
        if(i > 60)
        {
          pushMatrix(); translate(width/2, height / 8 * 3); rotate(PI/4); rect(0, 0, (i - 60) * .6, (i - 60) * .6); popMatrix();
          pushMatrix(); translate(width/2, height / 8 * 5); rotate(PI/4); rect(0, 0, (i - 60) * .6, (i - 60) * .6); popMatrix();
        }
        
        rectMode(CORNER);
      }
      strokeWeight(1);
      noStroke();
     }
     
     if(L.node1type == 3 || L.node2type == 3)
     {
       fill(87,189,171);
       PVector spawn = new PVector(0,0);
       for(int i = 0; i < L.freq * .5; i ++)
       {
         PVector temp = new PVector(random(0,1),random(-10,10));
         spawn.add(temp);
         
         pushMatrix();
         translate(width/2, height/2);
         pushMatrix();
           translate(spawn.x,spawn.y);
           beginShape();
             vertex(-2,0);
             vertex(2,0);
             vertex(0,3);
           endShape();
         popMatrix();
         
         pushMatrix();
           translate(-spawn.x,spawn.y);
           beginShape();
             vertex(-2,0);
             vertex(2,0);
             vertex(0,3);
           endShape();
         popMatrix();
         
         popMatrix();
       }
     }
     
     
  }
  
}
}


