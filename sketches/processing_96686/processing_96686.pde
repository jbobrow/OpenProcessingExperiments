
ArrayList<Integer> a;
int i = 1;
boolean set = false;
int j,b;

void setup(){
  size(400,400);
  a = new ArrayList<Integer>(20);
  for(int i = 0; i < 20; i++){
    a.add((int)random(1,200));
  }
}

void draw(){
  if(i < a.size()){
    if(!set){
      j = i;
      b = a.get(i);
      set = true;
    }
    if((j > 0) && (a.get(j-1) > b)){
      a.set(j,a.get(j-1));
      j--;
      a.set(j,b);
    } else {
      i++;
      set = false;
    }
    background(0);
    fill(100,100,255,200);
    rect(0,0,(i+1)*20,400);
    fill(255);
    for(int k = 0; k < a.size(); k++){
      rect(k*20 + 2.5, 0, 15, a.get(k)*2);
    }
    fill(255,0,0);
    rect(j*20 + 2.5, 0, 15, a.get(j)*2);
    for(int t = 0; t < 191000000; t++);
  } else {
    noLoop();
  }
}

