

PImage bg, chara;
String txt = "";
int bgAlpha = 0;
int charaAlpha = 0;
int textAlpha = 0;
String[] scenario;
int scenarioCur = 0;
String message = "";
int messageCur = 0;
boolean prevMousePressed = false;
PImage img;

void setup() {
  size(640, 480);
  textFont(createFont("Reishoreiryu", 20)); //String[] fontList = PFont.list(); println(fontList);
  scenario = loadStrings("scenario.txt");
}

void draw() {
  
  fill(0);
  rect(0,0,640,480);
  
  // 背景描画
  if(bgAlpha<255) bgAlpha += 20;
  if(bg!=null) {
    tint(255, bgAlpha);
    imageMode(CORNER);
    image(bg, 0, 0);
  } else background(0, bgAlpha);
  
  // キャラ描画
  if(chara!=null) {
    if(charaAlpha<255) charaAlpha += 20;
    tint(255, charaAlpha);
    imageMode(CENTER);
    image(chara, width/2, height/2);
  }
  
  // メッセージ背景描画
  int boardH = 80;
  int boardY = height-boardH;
  noStroke();
  fill(0, 0, 0, 200);
  rect(0, boardY, width, boardH);
  

  // メッセージ描画
  if(message.length()>0) {
    fill(255);
    textAlign(LEFT);
    text(message.substring(0, messageCur), 20, boardY+15, width-80, 20*2+20);
    if(messageCur<message.length()) messageCur++;
    else {
      
      // 入力待ち
      fill(255,0,0, sin(radians(millis()/2)) * 255);
      ellipse(width-30, height-30, 20, 20);
      if(mousePressed && !prevMousePressed) {
        message = ""; messageCur = 0;
      }
      
    }
  }
  

 if(messageCur<=0) {
    // 空行まで連続してシナリオコマンドを処理
    for(;;) {
      if(scenarioCur>=scenario.length) {
        exit(); break; // 終了
      }
      println(nf(scenarioCur, 4) + ": " + scenario[scenarioCur]); // for debug
//        text(scenario[scenarioCur], width/2, height/2);
      if(doCommand(scenario[scenarioCur++])) {
        println("----"); // for debug
        break;
      }
    }
  }
  prevMousePressed = mousePressed;
}


// テキストファイルに書かれたコマンドやメッセージ文字列を判別して処理
boolean doCommand(String commandStr) {
  
  if(commandStr.length()<=0) {
    return true; // 空行のときだけtrueを返す
  } else
  
  if(commandStr.charAt(0)==">") {
    // ">"で始まるテキストはコマンド
    String[] args = splitTokens(commandStr);
    if(args.length>0) {
 
//テキストコマンド
      if(">text".equals(args[0])) {
        textAlpha = 0;
        if(args.length>1) text(args[1],10,10);
        else txt = "";}
      else 
      
//イメージコマンド      
      if(">image".equals(args[0])) {
        charaAlpha = 0;
        if(args.length>1) chara = loadImage(args[1]);
        else chara = null;}
      else 

//背景コマンド
      if(">bg".equals(args[0])) {
        if(args.length>1) {
          bgAlpha = 0;
          bg = loadImage(args[1]);
          if (bg.width != width || bg.height != height) bg.resize(width, height);
        } else bg = null;
      }
      
    }
  } else {
    if(message.length()>0) message += "\n";
    message += commandStr;
  }
  return false;
}



