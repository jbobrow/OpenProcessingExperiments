
AnalogClock analogClock;
PImage train, maru;

void setup() {
  size(450, 450);
  smooth();
  analogClock = new AnalogClock(width/2, height/2);
  //画像ファイル設定
  train = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/trains.png?attachauth=ANoY7cpmgjx9iM-I7uv92QzYcMvpe41i6CEy1XRJ6QDdyRR4ccYrfG62VArzkL1SzqzoFQ5q4xedP05QZrJvEnhKgLLtVsuQrEgctF-60ve5U2w5JVfoohpS5qplnaMQ9xD0bAxLJFxUcikCaY-J-lZLbbeTbjkb8IfhWMAjwJUp-fdb_5JDKhYgIGknIw5SgrWDVYVvOu8wbbg22sQy77MBrWFoQdsn_g%3D%3D&attredirects=0");
  maru = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/glam.png?attachauth=ANoY7co9YZ0FsCOzQlGs0BiwosvKXu3VTX60SVL34DCFienOfpA8zwiFwybYkgXMDA_P-DlGvdOMNF6o9mOjKeKuIibLsDg91SJYOKi54Ox3bZRI-YRjIQGBY5g5zifguJvl9R4SJoOBBJ75aePGvwOIMfYTjE5DXvv7ivPjc41mcRvexRdowxDKwZy_-jhz0BeqF6dOecSTTDl3lhABRsh_3cqA6DotsQ%3D%3D&attredirects=0");
}

void draw() {
  background(255);
  analogClock.getTime();
  analogClock.display();
}

class AnalogClock extends Clock {
  float x, y;

  AnalogClock(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void getTime() {
    super.getTime();
    save("TrainClock.png");

  }

  void display() {
    //ダイヤ
    pushMatrix();
    translate(width/2, height/2);
    if(h == 4 && m >= 33) rotate(((m - 2.5) + s/60.0) * TWO_PI/60);  
    image(maru, 0, 0); //04:33発
    if(h == 5 && m <= 32) rotate(((m - 2.5) + s/60.0) * TWO_PI/60);  
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 4 && m >= 51) rotate(((m - 20.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //04:51発
    if(h == 5 && m <= 50) rotate(((m - 20.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 5 && m >= 1) rotate(((m + 29.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //05:01発
    if(h == 6 && m <= 0) rotate(((m + 29.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 5 && m >= 15) rotate(((m + 15.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //05:15発
    if(h == 6 && m <= 14) rotate(((m + 15.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 5 && m >= 23) rotate(((m + 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //05:23発
    if(h == 6 && m <= 22) rotate(((m + 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); 
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 5 && m >= 31) rotate(((m - 0.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //05:31発
    if(h == 6 && m <= 30) rotate(((m - 0.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 5 && m >= 38) rotate(((m - 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //05:38発
    if(h == 6 && m <= 37) rotate(((m - 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 5 && m >= 44) rotate(((m - 13.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //05:44発
    if(h == 6 && m <= 43) rotate(((m - 13.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 5 && m >= 50) rotate(((m - 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //05:50発
    if(h == 6 && m <= 49) rotate(((m - 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 5 && m >= 56) rotate(((m - 13.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //05:56発
    if(h == 6 && m <= 55) rotate(((m - 13.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 6 && m >= 2) rotate(((m + 28.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //06:01発
    if(h == 7 && m <= 1) rotate(((m + 28.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 6 && m >= 7) rotate(((m + 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //06:07発
    if(h == 7 && m <= 6) rotate(((m + 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 6 && m >= 11) rotate(((m + 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //06:11発
    if(h == 7 && m <= 10) rotate(((m + 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 6 && m >= 17) rotate(((m + 13.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //06:17発
    if(h == 7 && m <= 16) rotate(((m + 13.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 6 && m >= 21) rotate(((m + 9.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //06:21発
    if(h == 7 && m <= 20) rotate(((m + 9.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 6 && m >= 26) rotate(((m + 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //06:26発
    if(h == 7 && m <= 25) rotate(((m + 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 6 && m >= 32) rotate(((m - 1.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //06:32発
    if(h == 7 && m <= 31) rotate(((m - 1.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 6 && m >= 36) rotate(((m - 5.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //06:36発
    if(h == 7 && m <= 35) rotate(((m - 5.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 6 && m >= 39) rotate(((m - 8.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //06:39発
    if(h == 7 && m <= 38) rotate(((m - 8.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 6 && m >= 43) rotate(((m - 12.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //06:43発
    if(h == 7 && m <= 42) rotate(((m - 12.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 6 && m >= 47) rotate(((m - 16.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //06:47発
    if(h == 7 && m <= 46) rotate(((m - 16.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 6 && m >= 51) rotate(((m - 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //06:51発
    if(h == 7 && m <= 50) rotate(((m - 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 6 && m >= 54) rotate(((m - 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //06:54発
    if(h == 7 && m <= 53) rotate(((m - 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 6 && m >= 58) rotate(((m - 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //06:58発
    if(h == 7 && m <= 58) rotate(((m - 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 7 && m >= 2) rotate(((m + 28.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //07:02発
    if(h == 8 && m <= 1) rotate(((m + 28.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 7 && m >= 5) rotate(((m + 25.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //07:05発
    if(h == 8 && m <= 4) rotate(((m + 25.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 7 && m >= 8) rotate(((m + 22.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //07:08発
    if(h == 8 && m <= 7) rotate(((m + 22.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 7 && m >= 14) rotate(((m + 16.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //07:14発
    if(h == 8 && m <= 13) rotate(((m + 16.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 7 && m >= 16) rotate(((m + 14.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //07:16発
    if(h == 8 && m <= 15) rotate(((m + 14.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 7 && m >= 19) rotate(((m + 11.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //07:19発
    if(h == 8 && m <= 18) rotate(((m + 11.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 7 && m >= 25) rotate(((m + 5.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //07:25発
    if(h == 8 && m <= 24) rotate(((m + 5.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 7 && m >= 27) rotate(((m + 3.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //07:27発
    if(h == 8 && m <= 26) rotate(((m + 3.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 7 && m >= 30) rotate(((m + 0.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //07:30発
    if(h == 8 && m <= 29) rotate(((m + 0.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 7 && m >= 33) rotate(((m - 2.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //07:33発
    if(h == 8 && m <= 32) rotate(((m - 2.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 7 && m >= 35) rotate(((m - 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //07:35発
    if(h == 8 && m <= 34) rotate(((m - 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 7 && m >= 38) rotate(((m - 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //07:38発
    if(h == 8 && m <= 37) rotate(((m - 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 7 && m >= 40) rotate(((m - 9.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //07:40発
    if(h == 8 && m <= 39) rotate(((m - 9.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 7 && m >= 43) rotate(((m - 12.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //07:43発
    if(h == 8 && m <= 42) rotate(((m - 12.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 7 && m >= 45) rotate(((m - 14.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //07:45発
    if(h == 8 && m <= 45) rotate(((m - 14.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 7 && m >= 48) rotate(((m - 17.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //07:48発
    if(h == 8 && m <= 47) rotate(((m - 17.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 7 && m >= 50) rotate(((m - 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //07:50発
    if(h == 8 && m <= 49) rotate(((m - 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 7 && m >= 53) rotate(((m - 22.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //07:53発
    if(h == 8 && m <= 52) rotate(((m - 22.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 7 && m >= 55) rotate(((m - 24.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //07:55発
    if(h == 8 && m <= 54) rotate(((m - 24.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 7 && m >= 58) rotate(((m - 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //07:58発
    if(h == 8 && m <= 57) rotate(((m - 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 8 && m >= 0) rotate(((m + 30.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //08:00発
    if(h == 8 && m <= 59) rotate(((m + 30.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 8 && m >= 3) rotate(((m + 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //08:03発
    if(h == 9 && m <= 2) rotate(((m + 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 8 && m >= 6) rotate(((m + 24.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //08:06発
    if(h == 9 && m <= 5) rotate(((m + 24.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 8 && m >= 8) rotate(((m + 22.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //08:08発
    if(h == 9 && m <= 7) rotate(((m + 22.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 8 && m >= 11) rotate(((m + 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //08:11発
    if(h == 9 && m <= 10) rotate(((m + 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 8 && m >= 14) rotate(((m + 16.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //08:14発
    if(h == 9 && m <= 13) rotate(((m + 16.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 8 && m >= 16) rotate(((m + 14.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //08:16発
    if(h == 9 && m <= 15) rotate(((m + 14.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 8 && m >= 19) rotate(((m + 11.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //08:19発
    if(h == 9 && m <= 18) rotate(((m + 11.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 8 && m >= 22) rotate(((m + 8.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //08:22発
    if(h == 9 && m <= 21) rotate(((m + 8.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 8 && m >= 25) rotate(((m + 5.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //08:25発
    if(h == 9 && m <= 24) rotate(((m + 5.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 8 && m >= 27) rotate(((m + 3.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //08:27発
    if(h == 9 && m <= 26) rotate(((m + 3.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 8 && m >= 30) rotate(((m + 0.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //08:30発
    if(h == 9 && m <= 30) rotate(((m + 0.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 8 && m >= 33) rotate(((m - 2.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //08:33発
    if(h == 9 && m <= 32) rotate(((m - 2.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 8 && m >= 35) rotate(((m - 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //08:35発
    if(h == 9 && m <= 34) rotate(((m - 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 8 && m >= 38) rotate(((m - 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //08:38発
    if(h == 9 && m <= 37) rotate(((m - 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 8 && m >= 41) rotate(((m - 10.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //08:41発
    if(h == 9 && m <= 40) rotate(((m - 10.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 8 && m >= 43) rotate(((m - 12.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //08:43発
    if(h == 9 && m <= 42) rotate(((m - 12.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 8 && m >= 46) rotate(((m - 15.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //08:46発
    if(h == 9 && m <= 45) rotate(((m - 15.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 8 && m >= 48) rotate(((m - 17.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //08:48発
    if(h == 9 && m <= 47) rotate(((m - 17.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 8 && m >= 51) rotate(((m - 20.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //08:51発
    if(h == 9 && m <= 50) rotate(((m - 20.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 8 && m >= 53) rotate(((m - 22.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //08:53発
    if(h == 9 && m <= 52) rotate(((m - 22.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 8 && m >= 56) rotate(((m - 25.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //08:56発
    if(h == 9 && m <= 55) rotate(((m - 25.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 8 && m >= 58) rotate(((m - 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //08:58発
    if(h == 9 && m <= 57) rotate(((m - 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 9 && m >= 1) rotate(((m + 29.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //09:01発
    if(h == 10 && m <= 0) rotate(((m + 29.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 9 && m >= 3) rotate(((m + 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //09:03発
    if(h == 10 && m <= 2) rotate(((m + 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 9 && m >= 6) rotate(((m + 24.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //09:06発
    if(h == 10 && m <= 5) rotate(((m + 24.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 9 && m >= 9) rotate(((m + 21.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //09:09発
    if(h == 10 && m <= 8) rotate(((m + 21.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 9 && m >= 11) rotate(((m + 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //09:11発
    if(h == 10 && m <= 10) rotate(((m + 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 9 && m >= 14) rotate(((m + 16.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //09:14発
    if(h == 10 && m <= 13) rotate(((m + 16.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 9 && m >= 17) rotate(((m + 13.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //09:17発
    if(h == 10 && m <= 16) rotate(((m + 13.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 9 && m >= 20) rotate(((m + 10.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //09:20発
    if(h == 10 && m <= 19) rotate(((m + 10.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 9 && m >= 24) rotate(((m + 6.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //09:24発
    if(h == 10 && m <= 23) rotate(((m + 6.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 9 && m >= 27) rotate(((m + 3.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //09:27発
    if(h == 10 && m <= 26) rotate(((m + 3.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 9 && m >= 30) rotate(((m + 0.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //09:30発
    if(h == 10 && m <= 30) rotate(((m + 0.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 9 && m >= 33) rotate(((m - 2.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //09:33発
    if(h == 10 && m <= 32) rotate(((m - 2.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 9 && m >= 35) rotate(((m - 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //09:35発
    if(h == 10 && m <= 34) rotate(((m - 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 9 && m >= 38) rotate(((m - 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //09:38発
    if(h == 10 && m <= 37) rotate(((m - 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 9 && m >= 42) rotate(((m - 11.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //09:41発
    if(h == 10 && m <= 41) rotate(((m - 11.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 9 && m >= 45) rotate(((m - 14.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //09:45発
    if(h == 10 && m <= 44) rotate(((m - 14.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 9 && m >= 48) rotate(((m - 17.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //09:48発
    if(h == 10 && m <= 47) rotate(((m - 17.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 9 && m >= 52) rotate(((m - 21.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //09:52発
    if(h == 10 && m <= 51) rotate(((m - 21.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 9 && m >= 55) rotate(((m - 24.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //09:55発
    if(h == 10 && m <= 54) rotate(((m - 24.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 9 && m >= 58) rotate(((m - 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //09:58発
    if(h == 10 && m <= 57) rotate(((m - 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 10 && m >= 4) rotate(((m + 26.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //10:04発
    if(h == 11 && m <= 3) rotate(((m + 26.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 10 && m >= 7) rotate(((m + 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //10:07発
    if(h == 11 && m <= 6) rotate(((m + 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 10 && m >= 10) rotate(((m + 20.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //10:10発
    if(h == 11 && m <= 11) rotate(((m + 20.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 10 && m >= 14) rotate(((m + 16.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //10:13発
    if(h == 11 && m <= 13) rotate(((m + 16.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 10 && m >= 18) rotate(((m + 12.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //10:18発
    if(h == 11 && m <= 17) rotate(((m + 12.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 10 && m >= 22) rotate(((m + 8.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //10:22発
    if(h == 11 && m <= 21) rotate(((m + 8.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 10 && m >= 26) rotate(((m + 5.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //10:25発
    if(h == 11 && m <= 25) rotate(((m + 5.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 10 && m >= 29) rotate(((m + 1.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //10:29発
    if(h == 11 && m <= 28) rotate(((m + 1.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 10 && m >= 33) rotate(((m - 2.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //10:33発
    if(h == 11 && m <= 32) rotate(((m - 2.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 10 && m >= 38) rotate(((m - 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //10:38発
    if(h == 11 && m <= 37) rotate(((m - 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 10 && m >= 41) rotate(((m - 10.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //10:41発
    if(h == 11 && m <= 40) rotate(((m - 10.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 10 && m >= 46) rotate(((m - 15.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //10:46発
    if(h == 11 && m <= 45) rotate(((m - 15.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 10 && m >= 50) rotate(((m - 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //10:50発
    if(h == 11 && m <= 49) rotate(((m - 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 10 && m >= 53) rotate(((m - 22.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //10:53発
    if(h == 11 && m <= 52) rotate(((m - 22.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 10 && m >= 58) rotate(((m - 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //10:58発
    if(h == 11 && m <= 57) rotate(((m - 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 11 && m >= 2) rotate(((m + 28.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //11:02発
    if(h == 12 && m <= 1) rotate(((m + 28.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 11 && m >= 6) rotate(((m + 24.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //11:06発
    if(h == 12 && m <= 5) rotate(((m + 24.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 11 && m >= 10) rotate(((m + 20.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //11:10発
    if(h == 12 && m <= 9) rotate(((m + 20.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 11 && m >= 14) rotate(((m + 16.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //11:14発
    if(h == 12 && m <= 13) rotate(((m + 16.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 11 && m >= 18) rotate(((m + 12.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //11:18発
    if(h == 12 && m <= 17) rotate(((m + 12.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 11 && m >= 22) rotate(((m + 8.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //11:22発
    if(h == 12 && m <= 21) rotate(((m + 8.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 11 && m >= 26) rotate(((m + 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //11:26発
    if(h == 12 && m <= 25) rotate(((m + 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 11 && m >= 30) rotate(((m + 0.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //11:30発
    if(h == 12 && m <= 29) rotate(((m + 0.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 11 && m >= 34) rotate(((m - 3.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //11:34発
    if(h == 12 && m <= 33) rotate(((m - 3.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 11 && m >= 38) rotate(((m - 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //11:38発
    if(h == 12 && m <= 37) rotate(((m - 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 11 && m >= 42) rotate(((m - 11.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //11:42発
    if(h == 12 && m <= 41) rotate(((m - 11.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 11 && m >= 46) rotate(((m - 15.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //11:46発
    if(h == 12 && m <= 45) rotate(((m - 15.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 11 && m >= 50) rotate(((m - 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //11:50発
    if(h == 12 && m <= 49) rotate(((m - 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 11 && m >= 54) rotate(((m - 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //11:54発
    if(h == 12 && m <= 53) rotate(((m - 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 11 && m >= 58) rotate(((m - 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //11:58発
    if(h == 12 && m <= 57) rotate(((m - 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 12 && m >= 3) rotate(((m + 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //12:03発
    if(h == 13 && m <= 2) rotate(((m + 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 12 && m >= 7) rotate(((m + 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //12:07発
    if(h == 13 && m <= 6) rotate(((m + 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 12 && m >= 11) rotate(((m + 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //12:11発
    if(h == 13 && m <= 10) rotate(((m + 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 12 && m >= 15) rotate(((m + 15.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //12:15発
    if(h == 13 && m <= 14) rotate(((m + 15.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 12 && m >= 19) rotate(((m + 11.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //12:19発
    if(h == 13 && m <= 18) rotate(((m + 11.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 12 && m >= 23) rotate(((m + 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //12:23発
    if(h == 13 && m <= 22) rotate(((m + 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 12 && m >= 27) rotate(((m + 3.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //12:27発
    if(h == 13 && m <= 26) rotate(((m + 3.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 12 && m >= 31) rotate(((m - 0.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //12:31発
    if(h == 13 && m <= 30) rotate(((m - 0.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 12 && m >= 35) rotate(((m - 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //12:35発
    if(h == 13 && m <= 34) rotate(((m - 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 12 && m >= 39) rotate(((m - 8.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //12:39発
    if(h == 13 && m <= 38) rotate(((m - 8.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 12 && m >= 43) rotate(((m - 12.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //12:43発
    if(h == 13 && m <= 42) rotate(((m - 12.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 12 && m >= 47) rotate(((m - 16.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //12:47発
    if(h == 13 && m <= 46) rotate(((m - 16.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 12 && m >= 51) rotate(((m - 20.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //12:51発
    if(h == 13 && m <= 50) rotate(((m - 20.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 12 && m >= 55) rotate(((m - 24.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //12:55発
    if(h == 13 && m <= 54) rotate(((m - 24.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 12 && m >= 59) rotate(((m - 28.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //12:59発
    if(h == 13 && m <= 58) rotate(((m - 28.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 13 && m >= 3) rotate(((m + 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //13:03発
    if(h == 14 && m <= 2) rotate(((m + 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 13 && m >= 7) rotate(((m + 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //13:07発
    if(h == 14 && m <= 6) rotate(((m + 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 13 && m >= 11) rotate(((m + 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //13:11発
    if(h == 14 && m <= 10) rotate(((m + 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 13 && m >= 15) rotate(((m + 15.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //13:15発
    if(h == 14 && m <= 14) rotate(((m + 15.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 13 && m >= 19) rotate(((m + 11.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //13:19発
    if(h == 14 && m <= 18) rotate(((m + 11.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 13 && m >= 23) rotate(((m + 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //13:23発
    if(h == 14 && m <= 22) rotate(((m + 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 13 && m >= 27) rotate(((m + 3.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //13:27発
    if(h == 14 && m <= 26) rotate(((m + 3.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 13 && m >= 31) rotate(((m - 0.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //13:31発
    if(h == 14 && m <= 30) rotate(((m - 0.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 13 && m >= 35) rotate(((m - 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //13:35発
    if(h == 14 && m <= 34) rotate(((m - 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 13 && m >= 39) rotate(((m - 8.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //13:39発
    if(h == 14 && m <= 38) rotate(((m - 8.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 13 && m >= 43) rotate(((m - 12.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //13:43発
    if(h == 14 && m <= 42) rotate(((m - 12.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 13 && m >= 47) rotate(((m - 16.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //13:47発
    if(h == 14 && m <= 46) rotate(((m - 16.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 13 && m >= 51) rotate(((m - 20.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //13:51発
    if(h == 14 && m <= 50) rotate(((m - 20.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 13 && m >= 55) rotate(((m - 24.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //13:55発
    if(h == 14 && m <= 54) rotate(((m - 24.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 13 && m >= 59) rotate(((m - 28.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //13:59発
    if(h == 14 && m <= 58) rotate(((m - 28.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 14 && m >= 3) rotate(((m + 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //14:03発
    if(h == 15 && m <= 2) rotate(((m + 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 14 && m >= 7) rotate(((m + 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //14:07発
    if(h == 15 && m <= 6) rotate(((m + 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 14 && m >= 11) rotate(((m + 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //14:11発
    if(h == 15 && m <= 10) rotate(((m + 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 14 && m >= 15) rotate(((m + 15.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //14:15発
    if(h == 15 && m <= 14) rotate(((m + 15.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 14 && m >= 19) rotate(((m + 11.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //14:19発
    if(h == 15 && m <= 18) rotate(((m + 11.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 14 && m >= 23) rotate(((m + 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //14:23発
    if(h == 15 && m <= 22) rotate(((m + 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 14 && m >= 27) rotate(((m + 3.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //14:27発
    if(h == 15 && m <= 26) rotate(((m + 3.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 14 && m >= 31) rotate(((m - 0.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //14:31発
    if(h == 15 && m <= 30) rotate(((m - 0.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 14 && m >= 35) rotate(((m - 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //14:35発
    if(h == 15 && m <= 34) rotate(((m - 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 14 && m >= 39) rotate(((m - 8.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //14:39発
    if(h == 15 && m <= 38) rotate(((m - 8.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 14 && m >= 43) rotate(((m - 12.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //14:43発
    if(h == 15 && m <= 42) rotate(((m - 12.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 14 && m >= 47) rotate(((m - 16.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //14:47発
    if(h == 15 && m <= 46) rotate(((m - 16.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 14 && m >= 51) rotate(((m - 20.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //14:51発
    if(h == 15 && m <= 50) rotate(((m - 20.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 14 && m >= 55) rotate(((m - 24.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //14:55発
    if(h == 15 && m <= 54) rotate(((m - 24.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 14 && m >= 59) rotate(((m - 28.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //14:59発
    if(h == 15 && m <= 58) rotate(((m - 28.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 15 && m >= 3) rotate(((m + 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //15:03発
    if(h == 16 && m <= 2) rotate(((m + 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 15 && m >= 7) rotate(((m + 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //15:07発
    if(h == 16 && m <= 6) rotate(((m + 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 15 && m >= 11) rotate(((m + 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //15:11発
    if(h == 16 && m <= 10) rotate(((m + 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 15 && m >= 15) rotate(((m + 15.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //15:15発
    if(h == 16 && m <= 14) rotate(((m + 15.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 15 && m >= 19) rotate(((m + 11.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //15:19発
    if(h == 16 && m <= 18) rotate(((m + 11.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 15 && m >= 24) rotate(((m + 6.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //15:24発
    if(h == 16 && m <= 23) rotate(((m + 6.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 15 && m >= 28) rotate(((m + 2.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //15:28発
    if(h == 16 && m <= 27) rotate(((m + 2.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 15 && m >= 32) rotate(((m - 1.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //15:32発
    if(h == 16 && m <= 31) rotate(((m - 1.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 15 && m >= 35) rotate(((m - 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //15:35発
    if(h == 16 && m <= 34) rotate(((m - 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 15 && m >= 39) rotate(((m - 8.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //15:39発
    if(h == 16 && m <= 38) rotate(((m - 8.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 15 && m >= 43) rotate(((m - 12.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //15:43発
    if(h == 16 && m <= 42) rotate(((m - 12.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 15 && m >= 48) rotate(((m - 17.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //15:48発
    if(h == 16 && m <= 47) rotate(((m - 17.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 15 && m >= 52) rotate(((m - 21.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //15:52発
    if(h == 16 && m <= 51) rotate(((m - 21.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 15 && m >= 56) rotate(((m - 25.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //15:56発
    if(h == 16 && m <= 55) rotate(((m - 25.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 15 && m >= 59) rotate(((m - 28.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //15:59発
    if(h == 16 && m <= 58) rotate(((m - 28.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 16 && m >= 1) rotate(((m + 29.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //16:01発
    if(h == 17 && m <= 0) rotate(((m + 29.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 16 && m >= 4) rotate(((m + 26.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //16:04発
    if(h == 17 && m <= 3) rotate(((m + 26.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 16 && m >= 7) rotate(((m + 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //16:07発
    if(h == 17 && m <= 6) rotate(((m + 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 16 && m >= 11) rotate(((m + 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //16:11発
    if(h == 17 && m <= 10) rotate(((m + 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 16 && m >= 15) rotate(((m + 15.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //16:15発
    if(h == 17 && m <= 14) rotate(((m + 15.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 16 && m >= 19) rotate(((m + 11.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //16:19発
    if(h == 17 && m <= 18) rotate(((m + 11.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 16 && m >= 22) rotate(((m + 8.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //16:22発
    if(h == 17 && m <= 21) rotate(((m + 8.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 16 && m >= 25) rotate(((m + 5.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //16:25発
    if(h == 17 && m <= 24) rotate(((m + 5.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 16 && m >= 29) rotate(((m + 1.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //16:29発
    if(h == 17 && m <= 28) rotate(((m + 1.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 16 && m >= 32) rotate(((m - 1.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //16:32発
    if(h == 17 && m <= 31) rotate(((m - 1.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 16 && m >= 35) rotate(((m - 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //16:35発
    if(h == 17 && m <= 34) rotate(((m - 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 16 && m >= 38) rotate(((m - 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //16:38発
    if(h == 17 && m <= 37) rotate(((m - 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 16 && m >= 41) rotate(((m - 10.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //16:41発
    if(h == 17 && m <= 40) rotate(((m - 10.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 16 && m >= 44) rotate(((m - 13.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //16:44発
    if(h == 17 && m <= 43) rotate(((m - 13.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 16 && m >= 47) rotate(((m - 16.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //16:47発
    if(h == 17 && m <= 46) rotate(((m - 16.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 16 && m >= 50) rotate(((m - 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //16:50発
    if(h == 17 && m <= 49) rotate(((m - 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 16 && m >= 54) rotate(((m - 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //16:54発
    if(h == 17 && m <= 53) rotate(((m - 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 16 && m >= 57) rotate(((m - 26.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //16:57発
    if(h == 17 && m <= 56) rotate(((m - 26.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 17 && m >= 0) rotate(((m + 30.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //17:00発
    if(h == 17 && m <= 59) rotate(((m + 30.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 17 && m >= 3) rotate(((m + 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //17:03発
    if(h == 18 && m <= 2) rotate(((m + 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 17 && m >= 7) rotate(((m + 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //17:07発
    if(h == 18 && m <= 6) rotate(((m + 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 17 && m >= 10) rotate(((m + 20.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //17:10発
    if(h == 18 && m <= 9) rotate(((m + 20.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 17 && m >= 13) rotate(((m + 17.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //17:13発
    if(h == 18 && m <= 12) rotate(((m + 17.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 17 && m >= 16) rotate(((m + 14.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //17:16発
    if(h == 18 && m <= 15) rotate(((m + 14.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 17 && m >= 19) rotate(((m + 11.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //17:19発
    if(h == 18 && m <= 18) rotate(((m + 11.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 17 && m >= 22) rotate(((m + 8.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //17:22発
    if(h == 18 && m <= 21) rotate(((m + 8.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 17 && m >= 25) rotate(((m + 5.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //17:25発
    if(h == 18 && m <= 24) rotate(((m + 5.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 17 && m >= 28) rotate(((m + 2.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //17:28発
    if(h == 18 && m <= 27) rotate(((m + 2.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 17 && m >= 32) rotate(((m - 1.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //17:32発
    if(h == 18 && m <= 31) rotate(((m - 1.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 17 && m >= 35) rotate(((m - 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //17:35発
    if(h == 18 && m <= 34) rotate(((m - 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 17 && m >= 38) rotate(((m - 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //17:38発
    if(h == 18 && m <= 37) rotate(((m - 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 17 && m >= 41) rotate(((m - 10.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //17:41発
    if(h == 18 && m <= 40) rotate(((m - 10.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 17 && m >= 44) rotate(((m - 13.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //17:44発
    if(h == 18 && m <= 43) rotate(((m - 13.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 17 && m >= 47) rotate(((m - 16.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //17:47発
    if(h == 18 && m <= 46) rotate(((m - 16.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 17 && m >= 50) rotate(((m - 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //17:50発
    if(h == 18 && m <= 49) rotate(((m - 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 17 && m >= 53) rotate(((m - 22.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //17:52発
    if(h == 18 && m <= 52) rotate(((m - 22.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 17 && m >= 56) rotate(((m - 25.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //17:56発
    if(h == 18 && m <= 55) rotate(((m - 25.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 17 && m >= 59) rotate(((m - 28.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //17:59発
    if(h == 18 && m <= 58) rotate(((m - 28.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 18 && m >= 2) rotate(((m + 28.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //18:02発
    if(h == 19 && m <= 1) rotate(((m + 28.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 18 && m >= 5) rotate(((m + 25.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //18:05発
    if(h == 19 && m <= 4) rotate(((m + 25.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 18 && m >= 9) rotate(((m + 21.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //18:09発
    if(h == 19 && m <= 8) rotate(((m + 21.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 18 && m >= 12) rotate(((m + 18.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //18:12発
    if(h == 19 && m <= 11) rotate(((m + 18.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 18 && m >= 15) rotate(((m + 15.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //18:15発
    if(h == 19 && m <= 14) rotate(((m + 15.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 18 && m >= 18) rotate(((m + 12.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //18:18発
    if(h == 19 && m <= 17) rotate(((m + 12.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 18 && m >= 21) rotate(((m + 9.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //18:21発
    if(h == 19 && m <= 20) rotate(((m + 9.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 18 && m >= 24) rotate(((m + 6.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //18:24発
    if(h == 19 && m <= 23) rotate(((m + 6.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 18 && m >= 27) rotate(((m + 3.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //18:27発
    if(h == 19 && m <= 26) rotate(((m + 3.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 18 && m >= 30) rotate(((m + 0.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //18:30発
    if(h == 19 && m <= 29) rotate(((m + 0.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 18 && m >= 34) rotate(((m - 3.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //18:34発
    if(h == 19 && m <= 33) rotate(((m - 3.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 18 && m >= 37) rotate(((m - 6.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //18:37発
    if(h == 19 && m <= 36) rotate(((m - 6.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 18 && m >= 40) rotate(((m - 9.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //18:40発
    if(h == 19 && m <= 39) rotate(((m - 9.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 18 && m >= 43) rotate(((m - 12.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //18:43発
    if(h == 19 && m <= 42) rotate(((m - 12.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 18 && m >= 46) rotate(((m - 15.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //18:46発
    if(h == 19 && m <= 45) rotate(((m - 15.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 18 && m >= 49) rotate(((m - 18.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //18:49発
    if(h == 19 && m <= 48) rotate(((m - 18.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 18 && m >= 52) rotate(((m - 21.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //18:52発
    if(h == 19 && m <= 51) rotate(((m - 21.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 18 && m >= 55) rotate(((m - 24.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //18:55発
    if(h == 19 && m <= 54) rotate(((m - 24.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 18 && m >= 58) rotate(((m - 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //18:58発
    if(h == 19 && m <= 57) rotate(((m - 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 19 && m >= 1) rotate(((m + 29.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //19:01発
    if(h == 20 && m <= 0) rotate(((m + 29.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 19 && m >= 5) rotate(((m + 25.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //19:05発
    if(h == 20 && m <= 4) rotate(((m + 25.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 19 && m >= 8) rotate(((m + 22.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //19:08発
    if(h == 20 && m <= 7) rotate(((m + 22.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 19 && m >= 11) rotate(((m + 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //19:11発
    if(h == 20 && m <= 10) rotate(((m + 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 19 && m >= 14) rotate(((m + 16.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //19:14発
    if(h == 20 && m <= 13) rotate(((m + 16.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 19 && m >= 17) rotate(((m + 13.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //19:17発
    if(h == 20 && m <= 16) rotate(((m + 13.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 19 && m >= 20) rotate(((m + 10.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //19:20発
    if(h == 20 && m <= 19) rotate(((m + 10.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 19 && m >= 23) rotate(((m + 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //19:23発
    if(h == 20 && m <= 22) rotate(((m + 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 19 && m >= 26) rotate(((m + 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //19:26発
    if(h == 20 && m <= 25) rotate(((m + 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 19 && m >= 29) rotate(((m + 1.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //19:29発
    if(h == 20 && m <= 28) rotate(((m + 1.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 19 && m >= 33) rotate(((m - 2.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //19:33発
    if(h == 20 && m <= 32) rotate(((m - 2.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 19 && m >= 36) rotate(((m - 5.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //19:36発
    if(h == 20 && m <= 35) rotate(((m - 5.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 19 && m >= 39) rotate(((m - 8.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //19:39発
    if(h == 20 && m <= 38) rotate(((m - 8.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 19 && m >= 42) rotate(((m - 11.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //19:42発
    if(h == 20 && m <= 41) rotate(((m - 11.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 19 && m >= 45) rotate(((m - 14.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //19:45発
    if(h == 20 && m <= 44) rotate(((m - 14.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 19 && m >= 48) rotate(((m - 17.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //19:48発
    if(h == 20 && m <= 47) rotate(((m - 17.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 19 && m >= 51) rotate(((m - 20.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //19:51発
    if(h == 20 && m <= 50) rotate(((m - 20.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 19 && m >= 54) rotate(((m - 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //19:54発
    if(h == 20 && m <= 53) rotate(((m - 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 19 && m >= 57) rotate(((m - 26.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //19:57発
    if(h == 20 && m <= 56) rotate(((m - 26.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 20 && m >= 1) rotate(((m + 29.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //20:01発
    if(h == 21 && m <= 0) rotate(((m + 29.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 20 && m >= 4) rotate(((m + 26.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //20:04発
    if(h == 21 && m <= 3) rotate(((m + 26.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 20 && m >= 7) rotate(((m + 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //20:07発
    if(h == 21 && m <= 6) rotate(((m + 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 20 && m >= 10) rotate(((m + 20.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //20:10発
    if(h == 21 && m <= 9) rotate(((m + 20.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 20 && m >= 13) rotate(((m + 17.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //20:13発
    if(h == 21 && m <= 12) rotate(((m + 17.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 20 && m >= 16) rotate(((m + 14.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //20:16発
    if(h == 21 && m <= 15) rotate(((m + 14.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 20 && m >= 20) rotate(((m + 10.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //20:20発
    if(h == 21 && m <= 19) rotate(((m + 10.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 20 && m >= 23) rotate(((m + 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //20:23発
    if(h == 21 && m <= 22) rotate(((m + 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 20 && m >= 26) rotate(((m + 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //20:26発
    if(h == 21 && m <= 25) rotate(((m + 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 20 && m >= 30) rotate(((m + 0.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //20:30発
    if(h == 21 && m <= 29) rotate(((m + 0.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 20 && m >= 33) rotate(((m - 2.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //20:33発
    if(h == 21 && m <= 32) rotate(((m - 2.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 20 && m >= 36) rotate(((m - 5.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //20:36発
    if(h == 21 && m <= 35) rotate(((m - 5.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 20 && m >= 39) rotate(((m - 8.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //20:39発
    if(h == 21 && m <= 38) rotate(((m - 8.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 20 && m >= 43) rotate(((m - 12.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //20:43発
    if(h == 21 && m <= 42) rotate(((m - 12.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 20 && m >= 46) rotate(((m - 15.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //20:46発
    if(h == 21 && m <= 45) rotate(((m - 15.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 20 && m >= 49) rotate(((m - 18.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //20:49発
    if(h == 21 && m <= 48) rotate(((m - 18.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 20 && m >= 53) rotate(((m - 22.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //20:53発
    if(h == 21 && m <= 52) rotate(((m - 22.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 20 && m >= 57) rotate(((m - 26.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //20:57発
    if(h == 21 && m <= 56) rotate(((m - 26.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 21 && m >= 0) rotate(((m + 30.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //21:00発
    if(h == 22 && m <= 59) rotate(((m + 30.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 21 && m >= 3) rotate(((m + 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //21:03発
    if(h == 22 && m <= 2) rotate(((m + 27.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 21 && m >= 7) rotate(((m + 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //21:07発
    if(h == 22 && m <= 6) rotate(((m + 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 21 && m >= 15) rotate(((m + 15.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //21:15発
    if(h == 22 && m <= 14) rotate(((m + 15.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 21 && m >= 19) rotate(((m + 11.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //21:19発
    if(h == 22 && m <= 18) rotate(((m + 11.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 21 && m >= 23) rotate(((m + 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //21:23発
    if(h == 22 && m <= 22) rotate(((m + 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 21 && m >= 27) rotate(((m + 3.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //21:27発
    if(h == 22 && m <= 26) rotate(((m + 3.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 21 && m >= 30) rotate(((m + 0.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //21:30発
    if(h == 22 && m <= 30) rotate(((m + 0.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 21 && m >= 35) rotate(((m - 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //21:35発
    if(h == 22 && m <= 34) rotate(((m - 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 21 && m >= 39) rotate(((m - 8.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //21:39発
    if(h == 22 && m <= 38) rotate(((m - 8.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 21 && m >= 43) rotate(((m - 12.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //21:43発
    if(h == 22 && m <= 42) rotate(((m - 12.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 21 && m >= 47) rotate(((m - 16.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //21:47発
    if(h == 22 && m <= 46) rotate(((m - 16.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 21 && m >= 50) rotate(((m - 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //21:50発
    if(h == 22 && m <= 49) rotate(((m - 19.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 21 && m >= 55) rotate(((m - 24.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //21:55発
    if(h == 22 && m <= 54) rotate(((m - 24.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 22 && m >= 0) rotate(((m + 30.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //22:00発
    if(h == 22 && m <= 59) rotate(((m + 30.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 22 && m >= 5) rotate(((m + 25.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //22:05発
    if(h == 23 && m <= 4) rotate(((m + 25.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 22 && m >= 10) rotate(((m + 20.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //22:10発
    if(h == 23 && m <= 9) rotate(((m + 20.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 22 && m >= 15) rotate(((m + 15.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //22:15発
    if(h == 23 && m <= 14) rotate(((m + 15.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 22 && m >= 19) rotate(((m + 11.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //22:19発
    if(h == 23 && m <= 18) rotate(((m + 11.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 22 && m >= 24) rotate(((m + 6.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //22:24発
    if(h == 23 && m <= 23) rotate(((m + 6.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 22 && m >= 28) rotate(((m + 2.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //22:28発
    if(h == 23 && m <= 27) rotate(((m + 2.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 22 && m >= 33) rotate(((m - 2.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //22:33発
    if(h == 23 && m <= 32) rotate(((m - 2.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 22 && m >= 38) rotate(((m - 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //22:38発
    if(h == 23 && m <= 37) rotate(((m - 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 22 && m >= 44) rotate(((m - 13.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //22:44発
    if(h == 23 && m <= 43) rotate(((m - 13.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 22 && m >= 49) rotate(((m - 18.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //22:49発
    if(h == 23 && m <= 48) rotate(((m - 18.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 22 && m >= 54) rotate(((m - 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //22:54発
    if(h == 23 && m <= 53) rotate(((m - 23.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 22 && m >= 59) rotate(((m - 28.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //22:59発
    if(h == 23 && m <= 58) rotate(((m - 28.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 23 && m >= 4) rotate(((m + 26.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //23:04発
    if(h == 0 && m <= 3) rotate(((m + 26.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 23 && m >= 9) rotate(((m + 21.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //23:09発
    if(h == 0 && m <= 8) rotate(((m + 21.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 23 && m >= 13) rotate(((m + 17.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //23:13発
    if(h == 0 && m <= 12) rotate(((m + 17.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 23 && m >= 18) rotate(((m + 12.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //23:18発
    if(h == 0 && m <= 17) rotate(((m + 12.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 23 && m >= 23) rotate(((m + 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //23:23発
    if(h == 0 && m <= 22) rotate(((m + 7.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 23 && m >= 27) rotate(((m + 3.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //23:27発
    if(h == 0 && m <= 26) rotate(((m + 3.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 23 && m >= 32) rotate(((m - 1.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //23:31発
    if(h == 0 && m <= 31) rotate(((m - 1.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 23 && m >= 37) rotate(((m - 6.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //23:37発
    if(h == 0 && m <= 36) rotate(((m - 6.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 23 && m >= 42) rotate(((m - 11.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //23:42発
    if(h == 0 && m <= 41) rotate(((m - 11.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 23 && m >= 48) rotate(((m - 17.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //23:48発
    if(h == 0 && m <= 47) rotate(((m - 17.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 23 && m >= 54) rotate(((m - 13.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //23:54発
    if(h == 0 && m <= 53) rotate(((m - 13.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 0 && m >= 2) rotate(((m + 28.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //24:02発
    if(h == 1 && m <= 1) rotate(((m + 28.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 0 && m >= 16) rotate(((m + 14.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //23:16発
    if(h == 1 && m <= 15) rotate(((m + 14.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    if(h == 0 && m >= 26) rotate(((m + 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0); //23:26発
    if(h == 1 && m <= 25) rotate(((m + 4.5) + s/60.0) * TWO_PI/60); 
    image(maru, 0, 0);
    popMatrix();


    //盤
    println(train.width); //画像の幅をコンソールに表示
    println(train.height); //画像の高さをコンソールに表示
    image(train, (width - train.width) / 2, (height - train.height) / 2);
    //針の色
    stroke(0);
    //時
    pushMatrix();
    translate(width/2, height/2);
    rotate((h + m/60.0) % 12 * TWO_PI/12);
    strokeWeight(6);
    line(0, 0, 0, -100);
    popMatrix();
    //分
    pushMatrix();
    translate(width/2, height/2);
    rotate((m + s/60.0) * TWO_PI/60);
    strokeWeight(3);
    line(0, 0, 0, -120);
    popMatrix();
    //秒
    pushMatrix();
    translate(width/2, height/2);
    rotate(s * TWO_PI/60);
    strokeWeight(1);
    line(0, 0, 0, -120);
    popMatrix();
  }
}

class Clock {
  int h, m, s;
  Clock() {
  }

  void getTime() {
    h = hour();
    m = minute();
    s = second();
  }
}


                
                
