
String a = "Richard Wright";
String q = "\"Whitecaps on the bay:\nA broken signboard banging\nIn the April wind.\"";


void setup() {  //setup function called initially, only once
size(500, 200);
}

void draw() { 
background(120,155,175);
fill(255);

textSize(25);
textAlign(CENTER);
text(q, width/2,50);
textSize(12);
text(a, width/2,175);

}
