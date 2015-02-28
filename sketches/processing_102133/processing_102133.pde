
float pirm=0;  // pradines spalvos.  visur juoda
float antr=0;
float trec=0;
float ketv=0;

void setup(){
  size(500, 500);
}
void draw()
{
  background(0); // juodas fonas
  if (mouseX<width/2 && mouseY<height/2) { //1---------- jei pirmas kvadratas tada jo spalva bala
    pirm=pirm+2;
  }
  else   if (mouseX>width/2 && mouseY<height/2) { //2 ------------ jei antras kvadratas tada antra balinam
    antr=antr+2;
  }
  else  if (mouseX<width/2 && mouseY>height/2) { //3 --------- jei trecias kvadratas tai trecia balinam
    trec=trec+2;
  }
  else   if (mouseX>width/2 && mouseY>height/2) { //4 ----------- jei ketvirtas kvadratas tai ketvirta balinam
    ketv=ketv+2;
  }

  // visa laika kai iki cia ateina eile nuskaityt koda visos spalvos vel pradeda juodeti

  pirm=pirm-1;
  antr=antr-1;
  trec=trec-1;
  ketv=ketv-1;

  // sitoj vietoj kuriami spalvoti kvadratai
  noStroke();
  fill(pirm);
  rect(0, 0, width/2, height/2);
  fill(antr);
  rect(width/2, 0, width/2, height/2);
  fill(trec);
  rect(0, height/2, width/2, height/2);
  fill(ketv);
  rect(width/2, height/2, width/2, height/2);


  // cia skyrimo linijos
  stroke(255);
  line(0, height/2, width, height/2);
  line(width/2, 0, width/2, height);


  // kad kvadratai neperzengtu savo ribu sukuriamos  ribos baltai ir juodai spalvom
  pirm=constrain(pirm, 0, 255);
  antr=constrain(antr, 0, 255);
  trec=constrain(trec, 0, 255);
  ketv=constrain(ketv, 0, 255);
}
