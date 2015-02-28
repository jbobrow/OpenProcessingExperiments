
import controlP5.*;
ControlP5 controlP5;

Textfield answer;
Textarea challenge;
Textarea stat;
Textarea code;
Textarea how;
Textarea obj;
Textarea money;
Textarea bank;
Textarea codes;
Textarea cTries;

String curr;
String currans;
String ncurr;
String inorco;
int codescrkd = 0;
int tries = 0;
int posMoney = 0;
int curMoney = 0;

String sch1;
float fch1 = random(65,70);
int ich1 = int(fch1);
String ans1;

String sch2;
float fch2 = random(1,6);
int ich2 = int(fch2);
String ans2;

float fch3 = random(101,106);
int ich3 = int(fch3 - 50);
char cch3[] = {char(ich3)};
String sch3 = new String(cch3);
String ans3;

void setup()
{
  chkr1();
  chkr2();
  chkr3();
  background(0);
  size(500,200);
  controlP5 = new ControlP5(this);
  code = controlP5.addTextarea("definecode","The code:",10,10,70,20);
  answer = controlP5.addTextfield("Enter Code Here",200,150,100,20);
  challenge = controlP5.addTextarea("code",curr,50,30,50,40);
  stat = controlP5.addTextarea("status",inorco,200,139,149,20);
  how = controlP5.addTextarea("how",ncurr,350,10,140,100);
  obj = controlP5.addTextarea("obj","The Setup:\nYou are a skilled hacker, and you were recruited by an underground, unknown, government program. They were able to extract a series of codes, and they need you to break them. If you break them, you get paid a certain amount of money based on your tries, and you won't go to prison, as they promised they would send you there if you don't cooperate. Good Luck.",10,70,170,140);
  controlP5.addButton("check",0,305,150,33,20);
  bank = controlP5.addTextarea("bank","Money in your bank: $" + curMoney,350,100,140,20);
  money = controlP5.addTextarea("money","Money you can earn for next code broken: $" + posMoney,350,120,140,50);
  codes = controlP5.addTextarea("codes","Codes cracked: " + codescrkd,350,150,140,20);
  cTries = controlP5.addTextarea("tries","Incorrect tries: " + tries,350,170,140,20);
  posMoney = 100;
}

void chkr1()
{
  if (ich1 == 65)
  {
    sch1 = "01000001";
    ans1 = "A";
  }
  if (ich1 == 66)
  {
    sch1 = "01000010";
    ans1 = "B";
  }
  if (ich1 == 67)
  {
    sch1 = "01000011";
    ans1 = "C";
  }
  if (ich1 == 68)
  {
    sch1 = "01000100";
    ans1 = "D";
  }
  if (ich1 == 69)
  {
    sch1 = "01000101";
    ans1 = "E";
  }
  if (ich1 == 70)
  {
    sch1 = "01000110";
    ans1 = "F";
  }
}

void chkr2()
{
  if (ich2 == 1)
  {
    sch2 = "41";
    ans2 = "A";
  }
  if (ich2 == 2)
  {
    sch2 = "42";
    ans2 = "B";
  }
  if (ich2 == 3)
  {
    sch2 = "43";
    ans2 = "C";
  }
  if (ich2 == 4)
  {
    sch2 = "44";
    ans2 = "D";
  }
  if (ich2 == 5)
  {
    sch2 = "45";
    ans2 = "E";
  }
}

void chkr3()
{
  if (ich3 == 51)
  {
    ans3 = "A";
  }
  if (ich3 == 52)
  {
    ans3 = "B";
  }
  if (ich3 == 53)
  {
    ans3 = "C";
  }
  if (ich3 == 54)
  {
    ans3 = "D";
  }
  if (ich3 == 55)
  {
    ans3 = "E";
  }
  if (ich3 == 56)
  {
    ans3 = "F";
  }
}

public void check()
{
  String chkstring = answer.getText();
  if (chkstring.equals(currans))
  {
    fill(0);
    rect(350,10,150,190);
    rect(50,30,50,40);
    rect(200,139,149,20);
    inorco = "Correct!";
    stat.setText(inorco);
    codescrkd++;
    codes.setText("Codes cracked: " + codescrkd);
    curMoney = curMoney + posMoney;
    bank.setText("Money in your bank: $" + curMoney);
    println(chkstring + " " + currans);
    answer.clear();
    posMoney = 100;
  }
  else
  {
    fill(0);
    rect(350,10,150,190);
    rect(50,30,50,40);
    rect(200,139,149,20);
    inorco = "Incorrect!";
    stat.setText(inorco);
    posMoney = posMoney - 25;
    if (posMoney < 0)
    {
      posMoney = 0;
    }
    tries++;
    println(chkstring + " " + currans);
    cTries.setText("Incorrect tries: " + tries);
    money.setText("Money you can earn for next code broken: $" + posMoney);
    answer.clear();
  }
}

void draw()
{
  if (codescrkd == 0)
  {
    fill(0);
    rect(350,10,150,190);
    rect(50,30,50,40);
    rect(200,139,149,20);
    curr = sch1;
    challenge.setText(curr);
    ncurr = "Don't think decimal, think ASCII...";
    money.setText("Money you can earn for next code broken: $" + posMoney);
    how.setText(ncurr);
    currans = ans1;
  }
  if (codescrkd == 1)
  {
    fill(0);
    rect(350,10,150,190);
    rect(50,30,50,40);
    rect(200,139,149,20);
    curr = sch2;
    challenge.setText(curr);
    ncurr = "What is a very common code conversion besides decimal? Often used as 0x<code>...";
    money.setText("Money you can earn for next code broken: $" + posMoney);
    how.setText(ncurr);
    currans = ans2;
  }
  if (codescrkd == 2)
  {
    fill(0);
    rect(350,10,150,190);
    rect(50,30,50,40);
    rect(200,139,149,20);
    curr = sch3;
    challenge.setText(curr);
    ncurr = "Counted in eights, but subtracted by 50?\nThen converted to ASCII...";
    money.setText("Money you can earn for next code broken: $" + posMoney);
    how.setText(ncurr);
    currans = ans3;
  }
  if (codescrkd == 3)
  {
    fill(0);
    rect(350,10,150,190);
    rect(50,30,50,40);
    rect(200,139,149,20);
    challenge.setText("No more codes, for now...");
    if (curMoney == 300)
    {
      ncurr = "You have successfully cracked all the codes, and with flying colors. Good Job, you are free to go, for now...";
    }
    else
    {
      ncurr = "You have successfully cracked all the codes. Good Job, you are free to go, for now...";
    }
    how.setText(ncurr);
    posMoney = 0;
    money.setText("Money you can earn for next code broken: $" + posMoney);
    currans = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
  }
}

