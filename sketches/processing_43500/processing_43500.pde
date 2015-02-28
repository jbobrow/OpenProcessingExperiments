
int numFrames = 60; //アニメーションのフレーム数
PImage[] images = new PImage[numFrames]; //アニメーション画像の配列

void setup() {
  size(320, 240);
  frameRate(30);
  // 画像の読み込み
  for (int i = 0; i < images.length; i++) {
    images[i] = loadImage("http://dl.dropbox.com/u/446018/sq_iinaiina/animation-" + nf(i, 3) + ".jpg");
  }
}

void draw() {
  int frame = frameCount % numFrames; //現在のフレームをアニメーションのフレーム数で割った余りを代入
  image(images[frame], 0, 0); //画像を表示
}               
