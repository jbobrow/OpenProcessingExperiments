


int MUTATION_RATE = 200;
int TRAIL_LENGTH = 400;

int SELECTED = 0;

int num = 20;
ArrayList bot;

int fs = 9;

PVector cam;
float follow = 10.1;

void setup(){
  size(800,800,P2D);

  textFont(loadFont("Monaco-9.vlw"));

  cam = new PVector(0,0);

  rectMode(CENTER);

  bot = new ArrayList();
  for(int i = 0 ; i< num ;i ++)
    bot.add(new Bot());
}

void draw(){
  background(0);

  pushMatrix();
  stroke(30);
  for(float y = 100-(cam.y%100.0);y<height ; y+=100){
    stroke(255,map(abs(height/2-y),0,height/2,50,0));
    line(0,y,width,y);
  }
  for(float x = 0-(cam.x%100.0);x<width ; x+=100){
    stroke(255,map(abs(width/2-x),0,width/2,50,0));
    line(x,0,x,height);
  }


  translate(-cam.x+width/2.0,-cam.y+height/2.0);

  Bot tmp =  (Bot)bot.get(0);
  for(int i = 0 ; i< num ;i ++){
    tmp = (Bot)bot.get(i);
    if(i!=SELECTED)
      tmp.display();
  }
  tmp = (Bot)bot.get(SELECTED);
  tmp.display();
  cam.x += (tmp.pos.x-cam.x) / follow ; 
  cam.y += (tmp.pos.y-cam.y) / follow ; 
  popMatrix();

}
void mousePressed(){
  if(mouseButton==LEFT)  
    SELECTED++;

  if(mouseButton==RIGHT)
    SELECTED--;


  if(SELECTED<0)
    SELECTED = bot.size()-1;

  if(SELECTED>bot.size()-1)
    SELECTED=0;

}


class Bot{
  String code;
  PVector pos;
  int num_var = 9;
  float [] thetas;
  PVector direction;
  float speed = 0.00001;
  ArrayList vari;
  ArrayList trace;

  int w = 3;
  float smooth;
  int mutation_rate;

  Bot(){
    code = generateCode(num_var);
    pos = new PVector(random(-width,width),random(-height,height));

    speed = random(1.0,10.0);

    smooth = 300.0;

    thetas = new float[num_var];

    mutation_rate = (int)random(MUTATION_RATE/2,MUTATION_RATE*2);

    vari = new ArrayList();
    for(int i = 0 ; i < num_var;i++)
      vari.add((int)random(0,9));

    for(int i = 0; i < num_var;i++){
      int a = (Integer)vari.get(i);
      thetas[i] = (parseInt(code.charAt(a)));
    }

    trace = new ArrayList();

  }

  String generateCode(int siz){

    String result = "";

    for(int i = 0 ; i < 9;i++){
      result += (int)random(9);
    }

    return result;
  }


  void display(){

    direction = new PVector(0,0);
    for(int i = 0 ; i < thetas.length;i++){
      direction.add(new PVector(cos(thetas[i]),sin(thetas[i])));
    }
    direction.normalize();
    direction.mult(speed);
    pos.add(direction);


    drawTrail();

    pushMatrix();

    speed += (parseFloat(code.substring(0,3))/30.0-speed)/100.0;
    smooth += ((parseFloat(code.substring(3,6))/10.0+1.0)-smooth)/100.0;

    translate(pos.x,pos.y);
    
    if(SELECTED==bot.indexOf(this)){
    line(35+w/2,-35+w/2,80+w/2,-80+w/2);
    text(nf(bot.indexOf(this),2),90+w/2,-90+w/2);
    }
    fill(0);


    stroke(SELECTED==bot.indexOf(this)?color(255):color(100));

    for(int i = 8 ; i >= 0;i--){

      pushMatrix();
      int a = (Integer)vari.get(i);
      thetas[i] += (((parseInt(code.charAt( (a+code.charAt(a)+code.charAt(i))%(code.length()-1) ))))-thetas[i])/smooth;
      rotate(thetas[i]);
      line(0,0,w*fs+(fs/2.0)*i,0);
      rect(w*fs+(fs/2.0)*i,0,5,5);
      rect(0,0,w*fs+(fs/2.0)*i,w*fs+(fs/2.0)*i);
      popMatrix();

    }
    translate(-w/2.0*fs,-w/2.0*fs);
    fill(255);
    int x = 0, y=0;
    for(int i = 0 ; i < code.length();i++){
      text(code.charAt(i),x*fs+fs/4.0,y*fs+fs-fs/4.0);

      x++;
      if(x==w){
        x=0;y++;
      }

    }
    

    popMatrix();

    if(frameCount%mutation_rate==0)
      mutate();

    trace.add(new PVector(pos.x,pos.y));

    if(trace.size()>TRAIL_LENGTH)
      trace.remove(0);

    attract();
    align();
  }

  void drawTrail(){
    for(int i = 1 ; i< trace.size();i++){
      PVector tmp1 = (PVector)trace.get(i-1);
      PVector tmp2 = (PVector)trace.get(i);

      stroke(map(i,0,trace.size(),0,120));
      if(dist(tmp1.x,tmp1.y,tmp2.x,tmp2.y)<100)
        line(tmp1.x,tmp1.y,tmp2.x,tmp2.y);
    }



  }

  void mutate(){

    String base = code;

    int idx = (int)random(base.length());
    int ran = (int)random(0,10);
    code = code.substring(0,idx)+""+ran+""+code.substring(idx+1,base.length());

  }

  void attract(){
    for(int i = 0 ; i< bot.size();i++){
      Bot tmp = (Bot)bot.get(i);
      if(tmp!=this){
        pos.x += (tmp.pos.x-pos.x)/2000.0;
        pos.y += (tmp.pos.y-pos.y)/2000.0;
      }
    }

  }
  void align(){
    for(int i = 0 ; i< bot.size();i++){
      Bot tmp = (Bot)bot.get(i);
      float d = dist(pos.x-w/2,pos.y-w/2,tmp.pos.x-w/2,tmp.pos.y-w/2);
      if(d<width){
        
        if(d<255){
        stroke(255,(255-d)/5.0);
          line(pos.x,pos.y,tmp.pos.x,tmp.pos.y);
        }
        for(int q = 0 ; q < thetas.length;q++){
          thetas[q] += (tmp.thetas[q]-thetas[q])/(d*0.933+1.0);
          thetas[q] += (tmp.thetas[q]-thetas[q])/(d*0.933+1.0);
        }
      }
    }

  }
  void border(){
    if(pos.x>cam.x+width/2+100)mutate();
    if(pos.x<cam.x-width/2-100)mutate();
    if(pos.y>cam.y+height/2+100)mutate();
    if(pos.y<cam.y-height/2-100)mutate();
  }

  void turn(){
    for(int i = 0 ; i< thetas.length;i++)
      thetas[i] += 0.1;
  }

}



