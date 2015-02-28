
size(1000,1000);
textSize(100);
fill(0,255,0);
var color = 0;
var color2 = 0;
var textmover = 0;
var direction = 1;
var name1 = prompt("Please say a name.")
var name2 = prompt("Please say a different name.")
alert("Welcome!This program is made by zsiegel! I hope you have a great time!");
void draw()
{
    textmover = textmover + direction;
    if(textmover > 1000){direction = -10 }
    if(textmover < 0){direction = 10 }
    color++;
    if (color === 256){ color = 0 }
    color2++;
    if (color2 === 256) { color2 = 0}
    fill(color,color/2,color/3);
    rect(0,0,1000,500);
    fill(color,color2/3,color2/2);
    rect(0,500,1000,500);
    fill(255,255,255);
    if (mouseY > 500) {
        text(name1, textmover, 100);
    }
    else {
        text(name2, textmover, 100);
    }
}
