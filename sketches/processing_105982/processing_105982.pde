
ArrayList monsters;


void setup(){
  size(500,500);
  monsters = new ArrayList();
  for(int i = 0; i < random(3,7); i++){
    monsters.add(new Monster(new PVector(random(-width/2,width/2),random(-height/2,height/2)), random(.3,1.2), random(.01, .06)));
  }
}

void draw(){
  background(60,140,170);
  smooth();
  for( int i = 0; i < monsters.size(); i++){
    Monster m = (Monster) monsters.get(i);
    m.update();
    m.display();
  }

}

void keyPressed(){
  if(key == ' '){
    monsters = new ArrayList();
    for(int i = 0; i < random(3,7); i++){
    monsters.add(new Monster(new PVector(random(-width/2,width/2),random(-height/2,height/2)), random(.5,1.5), random(.01, .06)));
    }
  }
}

class Monster{
  float x, y, size, speed, t, inc, mag, mag2, wave, mC, c;
  int stripes;


  Monster(PVector mPos, float mScale, float mSpeed){
    x = mPos.x; y = mPos.y; size = mScale; speed = mSpeed;

    stripes = (int)random(1,10);
    t = 0.0; 
    inc = 0.0;
    mag = random(1,4); 
    mag2 = pow(mag, 2);
    wave = 0.0;
    mC = x;
    c = random(-20,20);

  }

  void update(){
    t += inc;
    inc = mag + sin((t)*speed);
    wave = sin((t)*speed);
    mC = x + sin(frameCount*speed)*mag2;
    y -= (inc);
    if(y < (height)*-1){
      y = height + height / size;
    }

  }

  void display(){
    pushMatrix();
    scale(size);
    monsDraw();
    popMatrix();
  }

  void monsDraw(){
    pushMatrix()
    translate(width/2, height/2);
    float h = (wave+wave/1.75)*5;

    fill(100+c, 100+c, 250+c);

    pushMatrix();
    translate(mC+100-80, y);
    rotate(radians(wave*10));
    translate(80, 10);
    scale(.8);
    finRDraw(new PVector(0,0));
    popMatrix();

    pushMatrix();
    translate(mC+100-80, y+90);
    rotate(radians(wave*10));
    translate(80, 10);
    scale(.7);
    rotate(radians(10));
    finRDraw(new PVector(0,0));
    popMatrix();
  //left fins
    pushMatrix();
    translate(mC-100+80, y);
    rotate(radians(-wave*10));
    translate(-80, 10);  
    scale(.8);
    finLDraw(new PVector(0,0));
    popMatrix();

    pushMatrix();
    translate(mC-100+80, y+90);
    rotate(radians(-wave*10));
    translate(-80, 10);  
    scale(.7);
    rotate(radians(-10));
    finLDraw(new PVector(0,0));
    popMatrix();

    fill(50+c,50+c,150+c);
    neckDraw(new PVector(mC, y-50));
    fill(80+c,80+c,120+c);
    strokeWeight(1);
    pushMatrix();
    translate(mC,y+15);
    scale(map(-wave, -1,1,.99,1.05));
    bodyDraw(new PVector(0,0));

    strokeWeight(1);
    fill(100+c,80+c,80+c);
    stripesDraw(new PVector(0, -20));

    popMatrix();

    //
    fill(80+c,80+c,130+c);
    snoutDraw(new PVector(mC, y-150+h));
    fill(70+c,70+c,120+c);
    headDraw(new PVector(mC, y-120+h));
    fill(0);
    ellipse(mC+10,y-120-7+h,5, 13);
    ellipse(mC-10,y-120-7+h,5,13);
    fill(255+c);
    spikeDraw(new PVector(mC, y-70+h));
    //
    pushMatrix();
    translate(mC, y-70+h);
    rotate(radians(-29));
    translate(35, 7);
    scale(.8);
    spikeDraw(new PVector(0,0));
    popMatrix();
    //
    pushMatrix();
    translate(mC, y-70+h);
    rotate(radians(29));
    translate(-35, 7);
    scale(.8);
    spikeDraw(new PVector(0,0));
    popMatrix();
    //
    fill(40+c,40+c,90+c);
    crestDraw(new PVector(mC, y-90+h));
    
    popMatrix();

  }

  void stripesDraw(PVector stripesPos){
    for(int i = 0; i < stripes; i++){
      float d = 125/stripes;
      beginShape();
      vertex(stripesPos.x, stripesPos.y -5 + d*i);
      vertex(stripesPos.x - 38 + 3*i, stripesPos.y + d*i);
      vertex(stripesPos.x, stripesPos.y +5 + d*i);
      vertex(stripesPos.x + 38 - 3*i, stripesPos.y + d*i);
      endShape(CLOSE);
    }
  }

  void finRDraw(PVector finRPos){
    beginShape();
    vertex(finRPos.x-80, finRPos.y-10);
    vertex(finRPos.x-25, finRPos.y-15);
    vertex(finRPos.x+20, finRPos.y-5);

    vertex(finRPos.x+80, finRPos.y+20);
    vertex(finRPos.x+65, finRPos.y+25);
    vertex(finRPos.x-20, finRPos.y+30);


    vertex(finRPos.x-55, finRPos.y+5);
    vertex(finRPos.x-80, finRPos.y+5);

    endShape(CLOSE);
  }

  void finLDraw(PVector finLPos){
    beginShape();
    vertex(finLPos.x+80, finLPos.y-10);
    vertex(finLPos.x+25, finLPos.y-15);
    vertex(finLPos.x-20, finLPos.y-5);

    vertex(finLPos.x-80, finLPos.y+20);
    vertex(finLPos.x-65, finLPos.y+25);
    vertex(finLPos.x+20, finLPos.y+30);


    vertex(finLPos.x+55, finLPos.y+5);
    vertex(finLPos.x+80, finLPos.y+5);

    endShape(CLOSE);
  }

  void neckDraw(PVector neckPos){
    beginShape();
    vertex(neckPos.x- 15, neckPos.y - 50);
    vertex(neckPos.x+ 15, neckPos.y - 50);
    vertex(neckPos.x+ 15, neckPos.y + 50);
    vertex(neckPos.x- 15, neckPos.y + 50);
    endShape(CLOSE);

  }

  void bodyDraw(PVector bodyPos){
    beginShape();
    vertex(bodyPos.x- 40, bodyPos.y - 45);
    vertex(bodyPos.x- 30, bodyPos.y - 50);
    vertex(bodyPos.x+ 30, bodyPos.y - 50);
    vertex(bodyPos.x+ 40, bodyPos.y - 45);
    vertex(bodyPos.x+ 50, bodyPos.y - 25);

    vertex(bodyPos.x+ 45, bodyPos.y + 90);
    vertex(bodyPos.x+30, bodyPos.y+115);
    vertex(bodyPos.x-30, bodyPos.y+115);
    vertex(bodyPos.x- 45, bodyPos.y + 90);
    vertex(bodyPos.x- 50, bodyPos.y - 25);
    vertex(bodyPos.x- 40, bodyPos.y - 45);
    endShape(CLOSE);

  }

  void spikeDraw(PVector spikePos){
    fill(255,255,240);
    beginShape();
    vertex(spikePos.x - 2, spikePos.y + 20);
    vertex(spikePos.x + 2, spikePos.y + 20);
    vertex(spikePos.x + 8, spikePos.y - 15);
    vertex(spikePos.x - 8, spikePos.y - 15);
    endShape(CLOSE);
    noFill();

  }

  void snoutDraw(PVector snoutPos){
    beginShape();
    vertex(snoutPos.x - 15, snoutPos.y + 15);
    vertex(snoutPos.x + 15, snoutPos.y + 15);
    vertex(snoutPos.x + 10, snoutPos.y - 15);
    vertex(snoutPos.x - 10, snoutPos.y - 15);
    endShape(CLOSE);

  }

  void headDraw(PVector headPos){
    beginShape();
    vertex(headPos.x - 23, headPos.y + 20);
    vertex(headPos.x + 23, headPos.y + 20);
    vertex(headPos.x + 17, headPos.y - 20);
    vertex(headPos.x - 17, headPos.y - 20);
    endShape(CLOSE);

  }

  void crestDraw(PVector crestPos){
    beginShape();
    vertex(crestPos.x - 32, crestPos.y - 10);
    vertex(crestPos.x - 37, crestPos.y);
    vertex(crestPos.x - 40, crestPos.y + 10);
    vertex(crestPos.x - 30, crestPos.y + 5);
    vertex(crestPos.x - 10, crestPos.y + 10);
    vertex(crestPos.x, crestPos.y + 15);
    vertex(crestPos.x + 10, crestPos.y + 10);
    vertex(crestPos.x + 30, crestPos.y + 5);
    vertex(crestPos.x + 40, crestPos.y + 10);
    vertex(crestPos.x + 37, crestPos.y);
    vertex(crestPos.x + 32, crestPos.y - 10);
    vertex(crestPos.x + 25, crestPos.y - 17);
    vertex(crestPos.x - 25, crestPos.y - 17);
    endShape(CLOSE);

  }

}


