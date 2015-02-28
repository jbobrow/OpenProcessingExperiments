
String[] chat = {"How","are","you?","I","am","fine","thank","you!"};
int count = 0;
void setup() {
  size(100, 100);
  frameRate(3);
}

void draw() {
  background(204);
  fill(0);
  textAlign(CENTER);
  text(chat[count], width/2, height/2);
  count++;
  if(count >= chat.length) count = 0;
}                               
