

class Chain {


  PVector pos;
  Chain n;
  int id;
  float d, theta;
  float x1, x2, y1, y2;
  PGraphics mapa;


  Chain(int _id) {
    id = _id;

    if (id==0)
      n = this;
    else
      n = (Chain)chain.get(id-1);

    mapa = createGraphics(120, 120, JAVA2D);
    mapa.beginDraw();
    mapa.textFont(font,110);
    mapa.fill(0);
    mapa.textAlign(CENTER);
    mapa.text(reversed.charAt(reversed.length()-1-(id%reversed.length())), mapa.width/2, mapa.height-30);
    mapa.scale(-1, 1);

    mapa.endDraw();


    theta = 0;
    pos = new PVector(-90, height/2);
  }

  void update() {
    if (id==0) {
      pos.x += (mouseX-pos.x)/1.1;
      pos.y += (mouseY-pos.y)/1.1;
    }
    else {

      pos.x += (n.pos.x-pos.x)/(10.1);
      pos.y += (n.pos.y-pos.y)/(10.1);
     // d = noise(id/30.0)*96*2;//
      //d += (n.d-d)/10.001;
      d = dist(pos.x, pos.y, n.pos.x, n.pos.y);//(dist(pos.x, pos.y, n.pos.x, n.pos.y)-d)/20.1; 
     

      theta = atan2(n.pos.y-pos.y, n.pos.x-pos.x);
    }



    pushMatrix();
    translate((pos.x+n.pos.x)*.5, (pos.y+n.pos.y)*0.5);




    x1 = screenX(cos(theta+QUARTER_PI)*d, sin(theta+QUARTER_PI)*d);
    y1 = screenY(cos(theta+QUARTER_PI)*d, sin(theta+QUARTER_PI)*d);

    x2 = screenX(cos(theta-QUARTER_PI)*d, sin(theta-QUARTER_PI)*d);
    y2 = screenY(cos(theta-QUARTER_PI)*d, sin(theta-QUARTER_PI)*d);

    popMatrix();
  }

  void draw() {



    fill(0,0);
    noStroke();
    beginShape();
    tint(255,d*12);
    texture(mapa);
    vertex(x2, y2, 0, 0);
    vertex(n.x2, n.y2, mapa.width, 0);
    vertex(n.x1, n.y1, mapa.width, mapa.height);
    vertex(x1, y1, 0, mapa.height);



    endShape(CLOSE);
    
    /*
     stroke(0, 100);
     line(x1, y1, n.x1, n.y1);
     line(x2, y2, n.x2, n.y2);
    
    switch(phase) {
     case 0:    
     triangle(
     x2, y2, 
     x1, y1, 
     n.x1, n.y1
     );
     break;
     case 1:
     triangle(
     x2, y2, 
     n.x2, n.y2, 
     n.x1, n.y1
     );
     break;
     
     
     case 2:
     
     triangle(
     x1, y1, 
     n.x2, n.y2, 
     n.x1, n.y2
     );
     break;
     
     
     case 3:
     triangle(
     x1, y1, 
     n.x1, n.y1, 
     x1, y2
     );
     break;
     }
     */
    /*
    quad(
     x1, y1, 
     x2, y2, 
     n.x2, n.y2, 
     n.x1, n.y1
     );*/
  }
}


