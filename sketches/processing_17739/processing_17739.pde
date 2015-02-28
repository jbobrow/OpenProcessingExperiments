
void createDots() {
  for(int i=0;i<months;i++) {
    float c = (b/months)*(i+1)+50;
    d = new Dot(c, height-100-(sums[i]*sizer), 30,i);
    engine.addDot(d);
  }
}

void createParticles() {
  for (int i =1; i<4; i++) {
    comics[i]="Images/"+dataTable.getString(ID*6+2,i)+".jpg"; 
    image[i] = loadImage(comics[i]);
  }
  for (int i=0;i<4;i++) {
    String q = dataTable.getString(ID*6+2,i);
    if (i==0) {
      p = new Particle("TOP 3", width/2,height/2, 80, i);
      p.setColor(150);
      engine.addParticle(p);
      engine.findParticle(i).pin(width/4+5,height/2);
    }
    else { 
      switch(i) {
      case 1: 
        posY = height/3;
        posX = width/4+5;
        break;
      case 2: 
        posY = height/2;
        posX = width/5;
        break;
      case 3: 
        posY = height/2;
        posX = width/3;
        break;
      default:
        println("Something went wrong!");   
        break;
      }
      p = new Particle(q, posX, posY, 50, i);
      p.setColor(255);
      engine.addParticle(p);
      engine.connectParticles(0, i);
    }
  }
}

void createNavs() {
  n = new Nav(0);
  engine.addNav(n);
  n = new Nav(1);
  engine.addNav(n);
  n = new Nav(2);
  engine.addNav(n);
  n = new Nav(3);
  engine.addNav(n);
  n = new Nav(4);
  engine.addNav(n);
}


