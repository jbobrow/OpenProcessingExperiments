
class CheckBox {
 String name;
 int x, y;
 int size;
 color baseCol;
 boolean checked = false;
 boolean isChecked() {
 return checked;
 }
 CheckBox(String s, int xp, int yp, int sz, color b) {
 name = s;
 x=xp;
 y=yp;
 size = sz;
 baseCol = b;
 }
 void press() {
 if ((mouseX >=x ) && (mouseX <= x+size) &&
 (mouseY >= y) && (mouseY <= y+size)) {
 checked = !checked;
 if (checked) println(name + " checked");
 else println(name + " unchecked");
 }
 }
 void display() {
 fill(baseCol);
 stroke(0);
 rect(x,y, size, size);
 textSize(60);
 text(name, x+size+10, y+size);
 if (checked) {
 line(x, y, x+size, y+size);
 line(x+size, y, x, y+size);
 }
 }
}
