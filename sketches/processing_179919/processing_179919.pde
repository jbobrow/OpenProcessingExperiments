
import SimpleOpenNI.*;
SimpleOpenNI  context;

//画面全体のスケール（開発中にモニタ小さいときのデバッグ用）
float debugScale = 0.5;

PImage bg;
PImage one;
PImage two;
PImage three;
PImage L;
PImage C;
PImage R;

PVector com = new PVector();                                   
PVector com2d = new PVector(); 

//録画する目的で画像をつくる
//5シーン * 60枚
PGraphics[][] canvas = new PGraphics[5][60];

//drawごとにカウントする
//画像を切り替えるのに使う
int count=0;

//最初の5*60枚の画像がたまるのを待つ変数
//int first=0;

//countが60超えるごとに1増える
//録画したシーンを切り替える
int sceneCount=0;

//x座標
int[] x= {
  260, 876, 1450
};
//y座標
int[] y= {
  660, 660, 680
};

//5シーンのサイズ
float[] imgScale = {
  0.8, 0.55, 0.8
};

int w, h;
int r;
int r2;
int timeCount;

void setup()
{
  context = new SimpleOpenNI(this);

  // shindo camera on
  if (context.enableDepth() == false)
  {
    println("Can't open the depthMap, maybe the camera is not connected!"); 
    exit();
    return;
  }

  // jinbutsu kensyutsu on
  context.enableUser();

  // RGB camera on
  if (context.enableRGB() == false)
  {
    println("Can't open the rgbMap, maybe the camera is not connected or there is no rgbSensor!"); 
    exit();
    return;
  }

  // gazou & shindo ichiawase
  context.alternativeViewPointDepthToImage();

  one = loadImage("1.png");
  two = loadImage("2.png");
  three = loadImage("3.png");
  bg = loadImage("4.png");
  L = loadImage("L.png");
  C = loadImage("C.png");
  R = loadImage("R.png");

  // canvas no ookisa
  size((int)(1697*debugScale), (int)(1080*debugScale)); // 24inch dekai


  w=context.depthWidth();
  h=context.depthHeight();

  //最初に300枚の画像を定義
  for (int i=0; i<60; i++) {
    for (int j=0; j<3; j++) {
      canvas[j][i] = createGraphics(w, h);
      canvas[j][i].beginDraw();
      canvas[j][i].background(0, 0);
      canvas[j][i].endDraw();
    }
  }
}

void draw()
{
  // camera koushin
  context.update(); 
  
  timeCount++;
  
  if(timeCount>2*60){
    timeCount=0;
    r = (int)random(3);
    r2 = (int)random(7);
  }  
  
  imageMode(CORNER);
  image(bg, 0, 0, width, height);
  

  // sceneImage no hito no bubun wo toridasu mask gazou wo tukuru
  PImage maskImg = makeImgForMask(context.userImage());
  PImage maskedImg = context.rgbImage(); // RGBcamera no eizou ga mask taisyou
  maskedImg.mask(maskImg); // jinbutu no katati de kurinuite





  //現在のsceneCountの、count番目に、ビデオの画像を描く
  //この時点では画面には表示されない
  canvas[sceneCount][count].beginDraw();
  canvas[sceneCount][count].background(0, 0);
  canvas[sceneCount][count].image(maskedImg, 0, 0);
  canvas[sceneCount][count].endDraw();

  //countを1ずつ進める
  count++;
  //60以上になったら
  if (count>=60) {
    //カウントをリセットし
    count=0;
    //シーンを1ずつ進める
    sceneCount++;
    //シーンが5以上になったら
    if (sceneCount>=3) {
      //シーンをリセット
      sceneCount=0;

      //first=1にして、最初の5*60枚の画像を準備できたことを知らせる
      //      first=1;
    }
  }

  // draw the skeleton if it's available
  int[] userList = context.getUsers();
  for (int i=0; i<userList.length; i++) {
    PVector vec = new PVector() ;
    context.getJointPositionSkeleton(userList[i], SimpleOpenNI.SKEL_TORSO, vec) ;
    if (vec.z > 0) println("distance of user" + i + " = " + vec.z) ;
    
    if (vec.z > 600) image(maskedImg, x[r], y[r]);  //eizou
  }


  //画面に表示させる
  for (int scene=0; scene<3; scene++) {
    imageMode(CENTER);
    image(canvas[scene][count], x[scene]*debugScale, y[scene]*debugScale, w*imgScale[scene]*debugScale, h*imgScale[scene]*debugScale);
  }


  imageMode(CORNER);
  //if(r == 2) image(three, 0, 0, width, height);

  image(two, 0, 0, width, height);
  
  image(one, 0, 0, width, height);
  
  //kabe
  if(r2 == 0) image(L, 0, 0, width, height);
  if(r2 == 1) image(C, 0, 0, width, height);
  if(r2 == 2) image(R, 0, 0, width, height);
  
  if(r2 == 3){
    image(L, 0, 0, width, height);
    image(C, 0, 0, width, height);
  }
  if(r2 == 4){
    image(L, 0, 0, width, height);
    image(R, 0, 0, width, height);
  }
  if(r2 == 5){
    image(C, 0, 0, width, height);
    image(R, 0, 0, width, height);
  }
  

  //debug用
  //  fill(255, 0, 0);
  //  textSize(24);
  //  text(userList.length, 10, 50);
}


// shindo eizou kara jinbutu dake wo nukidasuyouna mask wo kaesu
PImage makeImgForMask(PImage img)
{
  color cBlack = color(0, 0, 0);
  color cWhite = color(255, 255, 255);

  for (int x = 0; x < img.width; x++)
  {
    for (int y = 0; y < img.height; y++) 
    {
      color c = img.get(x, y);
      // hito ga inai shiro hai kuro ha RBG ga onaji
      if (red(c) == green(c) & green(c) == blue(c)) 
      {
        img.set(x, y, cBlack); // kuro de mask
      }
      // nanraka no iro ga tuiteiru bubun ha hito ga uttteiru
      else
      {
        img.set(x, y, cWhite); // siro de hito no bubun wo nokosu
      }
    }
  }
  return img;
}

// draw the skeleton with the selected joints
void drawSkeleton(int userId)
{
  // to get the 3d joint data
  /*
  PVector jointPos = new PVector();
   context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_NECK,jointPos);
   println(jointPos);
   */

  context.drawLimb(userId, SimpleOpenNI.SKEL_HEAD, SimpleOpenNI.SKEL_NECK);

  context.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_LEFT_ELBOW);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_ELBOW, SimpleOpenNI.SKEL_LEFT_HAND);

  context.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, SimpleOpenNI.SKEL_RIGHT_HAND);

  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_TORSO);

  context.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_LEFT_HIP);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HIP, SimpleOpenNI.SKEL_LEFT_KNEE);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_KNEE, SimpleOpenNI.SKEL_LEFT_FOOT);

  context.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_RIGHT_HIP);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_RIGHT_KNEE);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_KNEE, SimpleOpenNI.SKEL_RIGHT_FOOT);
}

// -----------------------------------------------------------------
// SimpleOpenNI events

void onNewUser(SimpleOpenNI curContext, int userId)
{
  println("onNewUser - userId: " + userId);
  println("\tstart tracking skeleton");

  curContext.startTrackingSkeleton(userId);
}

void onLostUser(SimpleOpenNI curContext, int userId)
{
  println("onLostUser - userId: " + userId);
}

void onVisibleUser(SimpleOpenNI curContext, int userId)
{
  //println("onVisibleUser - userId: " + userId);
}


void keyPressed()
{
  switch(key)
  {
  case ' ':
    context.setMirror(!context.mirror());
    break;
  }
}  

