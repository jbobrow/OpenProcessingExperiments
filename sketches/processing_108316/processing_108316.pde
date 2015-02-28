
ArrayList<Byte> x, y, z, vx, vy, vz;
ArrayList<Integer> c;

void setup(){
  size(1300, 1300);
  x = new ArrayList();
  y = new ArrayList();
  z = new ArrayList();
  vx = new ArrayList();
  vy = new ArrayList();
  vz = new ArrayList();
  c = new ArrayList();
  frameRate(60);
  noStroke();
}


void draw(){  
  for(int i = 0; i < x.size(); i++){
    x.set(i, byte(x.get(i)+vx.get(i)));
    y.set(i, byte(y.get(i)+vy.get(i)));
    z.set(i, byte(z.get(i)+vz.get(i)));
    fill(c.get(i));
    rect(map(x.get(i), -127, 127, 0, width)
        ,map(y.get(i), -127, 127, 0, height)
        ,random(150)
        ,random(150)); 
  }
  
  if(frameRate < 20  &&  x.size() > 0){
    x.remove(x.size()-1);
    y.remove(y.size()-1);
    z.remove(z.size()-1);
    vx.remove(x.size()-1);
    vy.remove(y.size()-1);
    vz.remove(z.size()-1);
    c.remove(z.size()-1);
  } else if(frameRate > 40){
    x.add(b());
    y.add(b());
    z.add(b());
    vx.add(b2());
    vy.add(b2());
    vz.add(b2());
    c.add(color(random(255),random(255),random(255),10));
  }
}


byte b(){
  return byte(random(-127,127));
}

byte b2(){
  return byte(random(-40,40));
}
