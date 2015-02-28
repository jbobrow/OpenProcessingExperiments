
int counter;

void setup() {  
 size(600,500);
font = loadFont("FFScala.ttf"); 
}
void draw() {

textFont(font);
fill(0, 0, 0); 

text("Etes-vous assez sobre pour envoyer des sms/appels?", 170, 150); 

fill(0, 0, 0);

text("Etes-vous assez sobre pour conduire?", 170,  300);

}
