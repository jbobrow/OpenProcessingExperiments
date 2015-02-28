
boolean[] alive;
boolean[] buffer;
boolean debug = true;
int size=20;
int time = 0, lastTime = 0;
void setup() {
  if(debug) size(screen.width, size*2,P2D);
  else size(screen.width, size);
  alive = new boolean[width/size];
  buffer = new boolean[width/size];
  //println(width/size);
  for(int i = 1; i < alive.length; i++) {
    alive[i] = 1000 > random(2000);
  }
  noStroke();
}
void draw() {
  time += millis() - lastTime;
  lastTime = millis();
  background(0,1);
  for(int i = 0; i < alive.length - 2; i++) {
    if(sumOfRange(alive, i, 2) > 1) {
      buffer[i] = true;
      //println("true");
    }
    if(sumOfRange(alive, i, 2) > 3) {
      buffer[i] = false;
    }
  }

  for(int i = 1; i < alive.length; i++) {
    if(alive[i]) {
      fill(255);
      rect(i*size, 0, size, size);
    }
    if(buffer[i] && debug) {
      fill(120);
      rect(i*size, size, size, size);
    }
  }
  if(time > 300) {
    alive = newBooleanArray(buffer);
    buffer = new boolean[buffer.length];
    time = 0;
  }
}

boolean[] newBooleanArray(boolean[] array) {
  boolean[] newArray = new boolean[array.length];
  for(int i = 0; i < array.length; i++) {
    newArray[i] = array[i];
  }
  return newArray;
}

int sumOfRange(boolean[] array, int field, int fields) {
  int sum = 0;
  if(array[field]) sum++;
  for(int i = 1; i < array.length && i <= fields; i++) {
    if(field + i < array.length && array[field + i]) sum++;
    if(field - i >= 0 && array[field - i]) sum++;
    //print(sum + ";");
  }
  //println(" " + field + ": " + fields);
  return sum;
}

void mouseDragged() {
  alive[mouseX/size] = true;
}


