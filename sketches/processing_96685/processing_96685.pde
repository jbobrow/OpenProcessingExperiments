
ArrayList<Integer> a;
int i = 0;
boolean set = false;
int j = 1,b = 0;

void setup(){
  size(400,400);
  a = new ArrayList<Integer>(20);
  for(int i = 0; i < 20; i++){
    a.add((int)random(1,200));
  }
}

void draw(){
  if(i < a.size()){
    if(j < a.size()-i){
      if(a.get(j-1) > a.get(j)){
        b = a.get(j-1);
        a.set(j-1,a.get(j));
        a.set(j,b);
      }
      j++;
    } else {
      i++;
      j = 1;
    }
  } else {
    noLoop();
  }
  background(100,100,255);
  fill(255);
  for(int k = 0; k < a.size(); k++){
    rect(k*20 + 2.5, 0, 15, a.get(k)*2);
  }
  fill(255,100,100);
  rect((j-1)*20 + 2.5, 0, 15, a.get(j-1)*2);
  fill(100,255,100);
  for(int k = a.size() - i; k < a.size(); k++){
    rect(k*20 + 2.5, 0, 15, a.get(k)*2);
  }
  for(int t = 0; t < 101000000; t++);
}

