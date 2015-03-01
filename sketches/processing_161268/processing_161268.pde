
https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSBIf7_SQGWydIQGIQlv05iahk29JhLT6PkUB1_rJ61tB8z0A4QhQPImage yyy;
float speed= 1;
float move;

void setup() {

size(720,960);
yyy=loadImage("http://www.1999.co.jp/itbig18/10188626b2.jpg");
}
void draw(){
move=move+speed;
image(yyy,7,move);
if (move > 6) {
move=0
}
}
