
//SÃ¦tter stÃ¸relsen pÃ¥ vinduet
size(800, 400);
 
//En for lÃ¸kke der starter pÃ¥ 0(i = 0), bliver en stÃ¸rre efter hvert gennemlÃ¸b(i++) og fortsÃ¦tter sÃ¥ lÃ¦nge i er mindre en 20 (i<20). 
for (int i = 0; i < 10; i++) {
  // Der vises teksten "Hello world" og x og y kordinaterne for denne visning forstÃ¸res i takt med at i vÃ¦rdien stiger.
  text("Hello world", 20 + (10*i), 20 + (10*i));
}
 
//En while lÃ¸kke der bliver ved med at sÃ¦tte "j" til random tal, indtil "j" bliver 5.
//"j" starter med vÃ¦rdien 0
int j = 0;
//SÃ¥ lÃ¦nge j ikke er 5 skal koden kÃ¸res 
while(j != 5){
  //Giver "j" en tilfÃ¦ldig vÃ¦rdi der er mellem 0 og 10
  j = int(random(10));
  //Hvis "j" er 5, printes det at mit yndlingstal er "j"
  if(j == 5){
    println("mit yndlingstal er: " + j);
  } 
  //Ellers printes det jeg ikke kan lide det tal "j" er blevet tildelt
  else {
    println("jeg kan ikke lide: " + j);
  }
}
