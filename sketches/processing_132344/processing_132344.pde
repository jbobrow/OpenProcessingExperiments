
//Squares being stupid
//Arthur Siebesian

size (500,500);
background(225);
for (int i = 5; i < 500; i = i+50) {
for (int j = 20; j < 250; j = j+50) {
  rect(i, j, 45, 45);
}
}

for (int i = 5; i < 500; i = i+50) {
for (int j = 270; j < 500; j = j+50) {
  rect(random(i), j, 45, 45);
}
}
  
