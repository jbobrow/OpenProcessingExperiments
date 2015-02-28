
void setup()
{
  size(400,400);
}

void draw()
{
  
  background(255,mouseY / 2.5,0);
  fill(0);
  noStroke();
  rectMode(CORNER);

  rect(10,10,160,110);
  rect(180,10,100,170);
  rect(290,10,100,140);
  rect(10,130,160,190);
  rect(180,190,210,100);
  rect(290,160,100,130);
  rect(10,330,80,60);
  rect(100,300,170,90);
  rect(280,300,110,90);

  fill(255,mouseY / 2.5,0);

  rect(90,300,10,20);
  rect(90,290,80,10);

  pushMatrix();
    translate(-110,-135);
    asd();
    asdf();
    asdfg();
    asdfgh();
  popMatrix();
  
  pushMatrix();
    translate(30,-145);
    sdf();
    sdfg();
    sdfgh();
    sdfghj();
  popMatrix();
  
  pushMatrix();
    translate(30,-65);
    sdf();
    sdfg();
    sdfgh();
    sdfghj();
  popMatrix();
  
  pushMatrix();
    translate(-150,10);
    dfg();
    dfgh();
    dfghj();
    dfghjk();
  popMatrix();
  
  pushMatrix();
    translate(-70,10);
    dfg();
    dfgh();
    dfghj();
    dfghjk();
  popMatrix();
  
  pushMatrix();
    translate(140,-120);
    fgh();
    fghj();
    fghjk();
    fghjkl();
  popMatrix();
  
  pushMatrix();
    translate(85,40);
    qwe();
    qwer();
    qwert();
    qwertz();
  popMatrix();

  pushMatrix();
    translate(135,145);
    wer();
    wert();
    wertz();
    wertzu();
  popMatrix();
  
  pushMatrix();
    translate(-150,160);
    ert();
    ertz();
    ertzu();
    ertzui();
  popMatrix();
  
  pushMatrix();
    translate(-15,145);
    rtz();
    rtzu();
    rtzui();
    rtzuio();
  popMatrix();
  
  pushMatrix();
    translate(110,-20);
    tzu();
    tzui();
    tzuio();
    tzuiop();
  popMatrix();
  
  pushMatrix();
    translate(140,-20);
    tzu();
    tzui();
    tzuio();
    tzuiop();
  popMatrix();
  
  pushMatrix();
    translate(170,-20);
    tzu();
    tzui();
    tzuio();
    tzuiop();
  popMatrix();
  
  pushMatrix();
    translate(-130,100);
    tzu();
    tzui();
    tzuio();
    tzuiop();
  popMatrix();
  
  pushMatrix();
    translate(-170,100);
    tzu();
    tzui();
    tzuio();
    tzuiop();
  popMatrix();
  
}

void asd()
{
  noStroke();
  fill(200,200,200,128);
  rectMode(CENTER);
  rect(width / 2,height / 2,140,90);
}

void asdf()
{
  noStroke();
  fill(200,200,200,128);
  rectMode(CENTER);
  rect(width/2 - width*0.03125 + mouseX*0.0625,height/2 - height*0.03125 + mouseY*0.0625,120,70);
}

void asdfg()
{
  noStroke();
  fill(200,200,200,128);
  rectMode(CENTER);
  rect(width/2 - width*0.0625 + mouseX*0.125,height/2 - height*0.0625 + mouseY*0.125,100,50);
}

void asdfgh()
{
  noStroke();
  fill(200,200,200,128);
  rectMode(CENTER);
  rect(width/2 - width*0.09375 + mouseX*0.1875,height/2 - height*0.09375 + mouseY*0.1875,80,30);
}

void sdf()
{
  noStroke();
  fill(200,200,200,128);
  rectMode(CENTER);
  rect(width / 2,height / 2,80,70);
}

void sdfg()
{
  noStroke();
  fill(200,200,200,128);
  rectMode(CENTER);
  rect(width/2 - width*0.03125 + mouseX*0.0625,height/2 - height*0.03125 + mouseY*0.0625,60,50);
}

void sdfgh()
{
  noStroke();
  fill(200,200,200,128);
  rectMode(CENTER);
  rect(width/2 - width*0.0625 + mouseX*0.125,height/2 - height*0.0625 + mouseY*0.125,40,30);
}

void sdfghj()
{
  noStroke();
  fill(200,200,200,128);
  rectMode(CENTER);
  rect(width/2 - width*0.09375 + mouseX*0.1875,height/2 - height*0.09375 + mouseY*0.1875,20,10);
}

void dfg()
{
  noStroke();
  fill(200,200,200,128);
  rectMode(CENTER);
  rect(width / 2,height / 2,60,140);
}

void dfgh()
{
  noStroke();
  fill(200,200,200,128);
  rectMode(CENTER);
  rect(width/2 - width*0.03125 + mouseX*0.0625,height/2 - height*0.03125 + mouseY*0.0625,50,130);
}

void dfghj()
{
  noStroke();
  fill(200,200,200,128);
  rectMode(CENTER);
  rect(width/2 - width*0.0625 + mouseX*0.125,height/2 - height*0.0625 + mouseY*0.125,40,120);
}

void dfghjk()
{
  noStroke();
  fill(200,200,200,128);
  rectMode(CENTER);
  rect(width/2 - width*0.09375 + mouseX*0.1875,height/2 - height*0.09375 + mouseY*0.1875,30,110);
}

void fgh()
{
  noStroke();
  fill(200,200,200,128);
  rectMode(CENTER);
  rect(width/2 - 25,height/2,30,120);
  rect(width/2 + 25,height/2,30,120);
  rect(width/2,height/2+45,20,30);
  rect(width/2,height/2-45,20,30);
}

void fghj()
{
  noStroke();
  fill(200,200,200,128);
  rectMode(CENTER);
  rect(width/2 - width*0.03125 + mouseX*0.0625 - 22.5,height/2 - height*0.03125 + mouseY*0.0625,25,110);
  rect(width/2 - width*0.03125 + mouseX*0.0625 + 22.5,height/2 - height*0.03125 + mouseY*0.0625,25,110);
  rect(width/2 - width*0.03125 + mouseX*0.0625,height/2 - height*0.03125 + mouseY*0.0625 -42.5,20,25);
  rect(width/2 - width*0.03125 + mouseX*0.0625,height/2 - height*0.03125 + mouseY*0.0625 +42.5,20,25);
}

void fghjk()
{
  noStroke();
  fill(200,200,200,128);
  rectMode(CENTER);
  rect(width/2 - width*0.0625 + mouseX*0.125 -20,height/2 - height*0.0625 + mouseY*0.125,20,100);
  rect(width/2 - width*0.0625 + mouseX*0.125 +20,height/2 - height*0.0625 + mouseY*0.125,20,100);
  rect(width/2 - width*0.0625 + mouseX*0.125,height/2 - height*0.0625 + mouseY*0.125 + 40,20,20);
  rect(width/2 - width*0.0625 + mouseX*0.125,height/2 - height*0.0625 + mouseY*0.125 - 40,20,20);
}

void fghjkl()
{
  noStroke();
  fill(200,200,200,128);
  rectMode(CENTER);
  rect(width/2 - width*0.09375 + mouseX*0.1875 - 17.5,height/2 - height*0.09375 + mouseY*0.1875,15,90);
  rect(width/2 - width*0.09375 + mouseX*0.1875 + 17.5,height/2 - height*0.09375 + mouseY*0.1875,15,90);
  rect(width/2 - width*0.09375 + mouseX*0.1875,height/2 - height*0.09375 + mouseY*0.1875 - 37.5,20,15);
  rect(width/2 - width*0.09375 + mouseX*0.1875,height/2 - height*0.09375 + mouseY*0.1875 + 37.5,20,15);
}

void qwe()
{
  noStroke();
  fill(200,200,200,128);
  ellipse(width / 2,height / 2,190,80);
}

void qwer()
{
  noStroke();
  fill(200,200,200,128);
  ellipse(width/2 - width*0.03125 + mouseX*0.0625,height/2 - height*0.03125 + mouseY*0.0625,170,60);
}

void qwert()
{
  noStroke();
  fill(200,200,200,128);
  ellipse(width/2 - width*0.0625 + mouseX*0.125,height/2 - height*0.0625 + mouseY*0.125,150,40);
}

void qwertz()
{
  noStroke();
  fill(200,200,200,128);
  ellipse(width/2 - width*0.09375 + mouseX*0.1875,height/2 - height*0.09375 + mouseY*0.1875,130,20);
}

void wer()
{
  noStroke();
  fill(200,200,200,128);
  rectMode(CENTER);
  rect(width / 2,height / 2,90,70);
}

void wert()
{
  noStroke();
  fill(200,200,200,128);
  rectMode(CENTER);
  rect(width/2 - width*0.03125 + mouseX*0.0625,height/2 - height*0.03125 + mouseY*0.0625,70,50);
}

void wertz()
{
  noStroke();
  fill(200,200,200,128);
  rectMode(CENTER);
  rect(width/2 - width*0.0625 + mouseX*0.125,height/2 - height*0.0625 + mouseY*0.125,50,30);
}

void wertzu()
{
  noStroke();
  fill(200,200,200,128);
  rectMode(CENTER);
  rect(width/2 - width*0.09375 + mouseX*0.1875,height/2 - height*0.09375 + mouseY*0.1875,30,10);
}

void ert()
{
  noStroke();
  fill(200,200,200,128);
  rectMode(CENTER);
  rect(width / 2,height / 2,70,50);
}

void ertz()
{
  noStroke();
  fill(200,200,200,128);
  rectMode(CENTER);
  rect(width/2 - width*0.03125 + mouseX*0.0625,height/2 - height*0.03125 + mouseY*0.0625,70,50);
}

void ertzu()
{
  noStroke();
  fill(200,200,200,128);
  rectMode(CENTER);
  rect(width/2 - width*0.0625 + mouseX*0.125,height/2 - height*0.0625 + mouseY*0.125,70,50);
}

void ertzui()
{
  noStroke();
  fill(200,200,200,128);
  rectMode(CENTER);
  rect(width/2 - width*0.09375 + mouseX*0.1875,height/2 - height*0.09375 + mouseY*0.1875,70,50);
}

void rtz()
{
  noStroke();
  fill(255,0,0,192);
  rectMode(CENTER);
  rect(width / 2,height / 2,150,70);
}

void rtzu()
{
  noStroke();
  fill(255,60,0,192);
  rectMode(CENTER);
  rect(width/2 - width*0.03125 + mouseX*0.0625,height/2 - height*0.03125 + mouseY*0.0625,110,60);
}

void rtzui()
{
  noStroke();
  fill(255,120,0,192);
  rectMode(CENTER);
  rect(width/2 - width*0.0625 + mouseX*0.125,height/2 - height*0.0625 + mouseY*0.125,70,50);
}

void rtzuio()
{
  noStroke();
  fill(255,180,0,192);
  rectMode(CENTER);
  rect(width/2 - width*0.09375 + mouseX*0.1875,height/2 - height*0.09375 + mouseY*0.1875,30,40);
}

void tzu()
{
  noStroke();
  fill(200,200,200,128);
  ellipse(width / 2,height / 2,20,20);
}

void tzui()
{
  noStroke();
  fill(200,200,200,128);
  ellipse(width/2 - width*0.03125 + mouseX*0.0625,height/2 - height*0.03125 + mouseY*0.0625,20,20);
}

void tzuio()
{
  noStroke();
  fill(200,200,200,128);
  ellipse(width/2 - width*0.0625 + mouseX*0.125,height/2 - height*0.0625 + mouseY*0.125,20,20);
}

void tzuiop()
{
  noStroke();
  fill(200,200,200,128);
  ellipse(width/2 - width*0.09375 + mouseX*0.1875,height/2 - height*0.09375 + mouseY*0.1875,20,20);
}







