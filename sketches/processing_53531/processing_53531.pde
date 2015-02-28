
/**
*  Neural Caravan by Krystof Pesek, licensed under Creative Commons Attribution-Share Alike 3.0 license.
*  Work: http://openprocessing.org/visuals/?visualID=53531
*  License: http://creativecommons.org/licenses/by-sa/3.0/
*
* visit more @ http://vimeo.com/kof
* if you leave this header, bend, share, spread the code, it is a freedom!
*
*   ,dPYb,                  ,dPYb,
*   IP'`Yb                  IP'`Yb
*   I8  8I                  I8  8I
*   I8  8bgg,               I8  8'
*   I8 dP" "8    ,ggggg,    I8 dP
*   I8d8bggP"   dP"  "Y8ggg I8dP
*   I8P' "Yb,  i8'    ,8I   I8P
*  ,d8    `Yb,,d8,   ,d8'  ,d8b,_
*  88P      Y8P"Y8888P"    PI8"8888
*                           I8 `8,
*                           I8  `8,
*                           I8   8I
*                           I8   8I
*                           I8, ,8'
*                            "Y8P'
*
*/



////////////////////////////////
ArrayList nodes;

// number of entities //
int num = 50;

// number of nurons per entity //
int neurons_per_node = 20;

// number of random connections between *neurons* //
int neuron_conectivity = 50;

// length of tail to draw //
int tail_length = 400;

// affecting radius between entities //
float avoidance_radius = 100.;
// the rate neuronal system reacts.. lower = quicker//
float learning_rate = 50.;
// the ratio between learning positive / negative experience //
float ratio = 8.;

// the other entitie copies movement of other neighbors //
boolean nodes_are_assimilating  = false;

// global movability of entities //
float glob_speed = 3.0;

// global radius //
float R = 40.0;


boolean rec = false;

boolean attract = true;
float attract_force =5000.0;

PVector follow;
float follow_speed = 70.0;


PGraphics fram;
/////////////////////////////////


boolean display_lines = true;
void setup(){
  size(640,320,P2D);

  noiseSeed(19);

  fram = mkFram(30,30);
 
  

  follow = new PVector(width/2,height/2);

  nodes = new ArrayList();
  for(int i = 0 ; i < num;i++)
    nodes.add(new Node(i,neurons_per_node,neuron_conectivity));
}

PGraphics mkFram(int w,int b){
  PGraphics tmp = createGraphics(width,height,P2D);

  tmp.beginDraw();
  tmp.strokeWeight(w);
  tmp.noFill();
  tmp.rect(0,0,width,height);
  
  tmp.filter(BLUR,b);
  tmp.endDraw();


  return tmp;
}


///////////////////////////////////////
void draw(){
  background(255);

  pushMatrix();


  translate(width/2.,height/2.);
  for(int i = 0 ; i < num;i++){

    Node n = (Node)nodes.get(i);

    follow.x += (n.pos.x - follow.x) / follow_speed;
    follow.y += (n.pos.y - follow.y) / follow_speed;
    pushMatrix();
    scale(noise((frameCount+i/10.0)/300.0));      
    translate(-follow.x,-follow.y);


    n.move();
    n.display();


    popMatrix();
  }
  popMatrix();


  fastblur(g,(int)(noise(frameCount/300.0)*4.0+1));
  //tint(255,20);
  //image(g,0,0);

  image(fram,0,0);

  if(rec)
    saveFrame("/home/kof/render/flys/fr#####.png");

}
class Node{
  ArrayList neurons;
  ArrayList connections;

  PVector pos;

  ArrayList tail;


  int id;
  int num;
  int connectivity;


  ///////////////////////////////////////
  Node(int _id,int _num,int _connectivity){
    id = _id;
    num = _num;
    connectivity = _connectivity;


    tail = new ArrayList();


    pos = new PVector(random(width),random(height));

    neurons = new ArrayList();
    for(int i =0 ; i < num;i++)
      neurons.add(new Neuron(this,i));

    connections = new ArrayList();
    for(int i =0 ; i < connectivity;i++){
      Neuron n1,n2;
      n1 = (Neuron)neurons.get((int)random(neurons.size()));
      n2 = (Neuron)neurons.get((int)random(neurons.size()));

      while(n1==n2){
        n1 = (Neuron)neurons.get((int)random(neurons.size()));
        n2 = (Neuron)neurons.get((int)random(neurons.size()));
      }

      connections.add(new Connection(n1,n2));

    }
  }

  ///////////////////////////////////////
  void move(){

    if(attract)
      for(int i =0  ; i < nodes.size();i++){
        Node n  = (Node)nodes.get(i);
        if(n!=this){
          pos.x += (n.pos.x-pos.x)/attract_force;
          pos.y += (n.pos.y-pos.y)/attract_force;
        }
      }

    for(int i =0  ; i < neurons.size();i++){
      Neuron n  = (Neuron)neurons.get(i);

      PVector tmp = new PVector(n.pos.x,n.pos.y);

      tmp.normalize();


      tmp.mult(n.val*glob_speed);
      pos.add(tmp);


    }

    // border2();

  }

  ///////////////////////////////////////
  void border(){

    pos.x = constrain(pos.x,0,width);
    pos.y = constrain(pos.y,0,height);

  }
  void border2(){

    if(pos.x>width)pos.x = 0;
    if(pos.x<0)pos.x = width;


    if(pos.y>height)pos.y = 0;
    if(pos.y<0)pos.y = height;
  }



  //////////////////////////////////////
  void display(){

    pushMatrix();

    translate(pos.x,pos.y);

    for(int i = 0 ; i < connections.size();i++){
      Connection c = (Connection)connections.get(i);
      c.display();

    }

    for(int i = 0 ; i < neurons.size();i++){
      Neuron n = (Neuron)neurons.get(i);
      n.display();

    }


    avoid();

    popMatrix();

    if(tail.size()>1)
      for(int i = 1 ; i < tail.size();i++)
      {

        PVector segment1 = (PVector)tail.get(i-1);
        PVector segment2 = (PVector)tail.get(i);
        stroke(0,map(i,0,tail.size(),0,127));
        float dd = dist(segment1.x,segment1.y,segment2.x,segment2.y);
        if(dd<width/2){
          //strokeWeight(dd);
          line(segment1.x,segment1.y,segment2.x,segment2.y);

        }
        strokeWeight(1);
      }

    addTail();
  }
  ///////////////////////////////////////

  ///////////////////////////////////////
  void addTail(){
    if(tail.size()<tail_length)
      tail.add(new PVector(pos.x,pos.y));
    else
      tail.remove(0);
  }


  ///////////////////////////////////////
  void avoid(){
    for(int i = 0 ; i< nodes.size();i++){
      Node other = (Node)nodes.get(i);
      if(this!=other){
        float d = dist(pos.x,pos.y,other.pos.x,other.pos.y);
        if(d < avoidance_radius){
          // weaken connection
          for(int q = 0;q<connections.size();q++){

            Connection con = (Connection)connections.get(q);
            stroke(0,map(d,0,avoidance_radius,127,0));
            line(con.one.pos.x,con.one.pos.y,con.two.pos.x,con.two.pos.y);
            con.w += (d/avoidance_radius*con.one.val*con.two.val-con.w)/learning_rate;

          }

          if(nodes_are_assimilating)
            for(int q = 0 ; q < neurons.size() ; q ++){
              Neuron n = (Neuron)neurons.get(q);
              Neuron other_n = (Neuron)other.neurons.get(q);

              if(n!=other_n){
                n.pos.x += (other_n.pos.x-n.pos.x) / learning_rate;
                n.pos.y += (other_n.pos.y-n.pos.y) / learning_rate;
              }
            }

        }else{
          // strangten connections
          for(int q = 0;q<connections.size();q++){

            Connection con = (Connection)connections.get(q);
            con.w += (1.0-con.w)/(learning_rate*ratio); 
          }


        }
      }
    }

  }
}

///////////////////////////////////////
class Neuron{
  Node parent;
  int id;
  PVector pos;
  float val;


  ///////////////////////////////////////
  Neuron(Node _parent,int _id){
    parent = parent;
    id = _id;
    val = random(0,100) / 100.0;
    pos = new PVector(random(-10,10),random(-10,10));
  }

  ///////////////////////////////////////
  void display(){
    stroke(0,val*255);
    point(pos.x,pos.y);

  }


}

///////////////////////////////////////
class Connection{
  float w;
  Neuron one,two;
  float pulse = 0;

  float diff;
  ///////////////////////////////////////
  Connection(Neuron _one,Neuron _two){
    one = _one;
    two = _two;
    w = random(0,100) / 100.0;
    diff = random(-100,100);
  }

  ///////////////////////////////////////
  void display(){

    if(display_lines){
      stroke(0,w*25);
      line(one.pos.x,one.pos.y,two.pos.x,two.pos.y);
    }

    update();
  }

  ///////////////////////////////////////
  void update(){
    pulse = noise((diff+frameCount)/(one.id+two.id+40.0))*1.5;


    one.pos.x = cos(pulse*3.)*R*w;
    one.pos.y = sin(pulse*3.)*R*w;


    two.pos.x = sin(pulse*3.)*R*w;
    two.pos.y = cos(pulse*3.)*R*w;


    one.val += (two.val*w-one.val)/((pulse+2.0)*3.0);

  }

}

