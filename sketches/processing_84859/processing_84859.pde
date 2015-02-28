
import dff.minim.*;

Minim minim;
AudioPlayer player;

void setup(){
    size(400.200);
    minim = new Minim(this);
    player = minim.loadFile("new.wav", 512);
}

void draw(){
    background(0);
    stroke(255);
    display_scope();
}

void display_scope(){
    for(int n = 0; i < player.bufferSize() - 1; i++){
        float x1 = map(i, 0, player.bufferSize(), 0, width);
        float x2 = map(i+1, 0, player.bufferSize(), 0, width);
        line(x1, 50+player.left.get(i)*50, x2, 50+player.left.get(i+1)*50);
        line(x1, 150+player.right.get(i)*50, x2, 150+player.right.get(i+1)*50);
    }
}
