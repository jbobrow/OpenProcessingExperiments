

boolean startScreen = true, caloriesPage1 = false, caloriesPage2 = false, caloriesPage3 = false, caloriesPage4 = false, backbutton = false;


void setup(){
  size(900,800);
}

void draw(){
  if(startScreen){
  background(0);
  text("How many calories have you burned today?", 20, 20);
  text("0 - 200 Calories", 40, 50);
  text("201 - 400 Calories", 40, 80);
  text("401 - 600 Calories", 40, 110);
  text("601 - 800 Calories", 40, 140);

  
  rect(200, 35, 20, 20);
  rect(200, 65, 20, 20);
  rect(200, 95, 20, 20);
  rect(200, 125, 20, 20);  
  
  
  
  
  
  if((mouseX > 200) && (mouseX < 220) && (mouseY > 35) && (mouseY < 55)){
  
  if(mousePressed){
    caloriesPage1 = true;

     startScreen = false;
    

  }
  }
  

  
  if((mouseX > 200) && (mouseX < 220) && (mouseY > 65) && (mouseY < 85)){
  
  if(mousePressed){
    caloriesPage2 = true;
    startScreen=false;
  

  }
  }
  }
  
 if((mouseX > 200) && (mouseX < 220) && (mouseY > 95) && (mouseY < 115)){
  
  if(mousePressed){
    caloriesPage3 = true;
    startScreen = false;
 }
 }
  if((mouseX > 200) && (mouseX < 220) && (mouseY > 125) && (mouseY < 145)){
  
  if(mousePressed){
    caloriesPage4 = true;
    startScreen = false;
 }
 }

  
  
  if(caloriesPage1){
   background(#08E8FF); 
   text("Piccolo tomato and red onion salad recipe \n\n\nIngredients:\n\n15 Piccolo tomatoes, sliced \n1 smallred onion, finely sliced \nblack pepper \nextra virgin olive oil \nbalsamic vinegar \n\nMethod: \n\nMix together the tomatoes and red onion\nDrizzle with balsamic vinegar and olive oil, season with black pepper", 10, 20);
   rect(750,20,80,25);
   fill(0);
   text("< BACK",760,37);
   noStroke();
   fill(255);
   
     if((mouseX > 750) && (mouseX < 830) && (mouseY > 20) && (mouseY < 45)){
    if(mousePressed){
      startScreen = true;
      caloriesPage1 = false;
    }
  }  
  }
 
     
   
    if(caloriesPage2){
   background(#08E8FF); 
    text("Chicken and tomato spiced curry recipe \n\nIngredients: \n\n3tbsp vegetable oil \n1 onion, peeled and roughly chopped \n2 garlic cloves, peeled and crushed \n1tbsp Madras curry paste \n1tsp red wine vinegar \n450g cooked chicken, cut into bite sized pieces \n300g vegetables such as red peppers, cauliflower, beans, carrots \n1tbsp tomato paste \n400g canned chopped tomatoes \n sea salt \nground black peppercorns \nsprigs of coriander herbs \n\nHeat the oil in a large frying pan, reduce the heat and add the onion and garlic. Cook over a medium heat until golden. \n\nAdd the curry paste and cook for 1 minute to cook off the spices. \n\nAdd the tomato puree, chopped tomatoes, vinegar and 200ml water to the frying pan. Bring to the boil and simmer uncovered for about \n5 minutes. \n\nAdd your chosen vegetables and cook for about 5 minutes until the vegetables are tender. Stir in the chicken pieces and season \nwith salt and pepper. Simmer gently for a few minutes or until the chicken is piping hot. ",10,20);
    rect(750,20,80,25);
   fill(0);
   text("< BACK",760,37);
   noStroke();
   fill(255);
 if((mouseX > 750) && (mouseX < 830) && (mouseY > 20) && (mouseY < 45)){
    if(mousePressed){
      startScreen = true;
      caloriesPage2 = false;
    }

    }
    }
    if(caloriesPage3){
   background(#08E8FF); 
     text("Butterbean and spinach burgers with cucumber tzatziki recipe: \n\n\nIngredients:\n\n300g (10oz) pack fresh leaf spinach \n2 salad onions, sliced \n1garlic clove,sliced \n420g can butterbeans \n 125g (4oz) fresh white breadcrumbs \n1egg yolk \ncayenne pepper \n\n Method: \n\nSqueeze the spinach to remove excess water and roughly chop. \nWhizz the salad onions and garlic in a food processor until finely chopped. Add the beans (drained) and whiz again to form a coarse puree. \nAdd the breadcrumbs, spinach, egg yolk and a pinch of cayenne. Season and pulse together to form a paste. \nShape the mixture into 4 cakes. Grill for 5 minutes on each side until lightly browned and heated through. \nServe in rolls with tzatziki and salad leaves.",10,20);
  rect(750,20,80,25);
   fill(0);
   text("< BACK",760,37);
   noStroke();
   fill(255);
    if((mouseX > 750) && (mouseX < 830) && (mouseY > 20) && (mouseY < 45)){
    if(mousePressed){
      startScreen = true;
      caloriesPage3 = false;
    }
}
    }
    if(caloriesPage4){
   background(#08E8FF); 
   text("Lamb Casserole with dumplings\n\nIngredients:\nFor the casserole\n2tbsp plain flour\n600g lamb boneless shoulder, trimmed of excess fat, meat cubed\n2-3tbsp olive oil\nsmall knob butter\n1 large onion, chopped\n2 garlic cloves, finely chopped\n1tbsp tomato purée\n700ml hot lamb or chicken stock\n2 medium carrots, diced\n1 large potato, diced\nsprig rosemary\nsprig thyme\nhandful roughly chopped flat leaf parsley\n\nFor the dumplings\n100g self-raising flour\n50g butter, cut in pieces\n1tsp rosemary leaves, finely chopped\n1tsp thyme leaves, finely chopped\n2tsp flat leaf parsley leaves, finely chopped\n\nMethod:\n\nPreheat the oven to gas 4, 180℃, fan 160℃.\nPut the flour in a large bowl and season with salt and freshly ground black pepper.\n Toss the lamb in the seasoned flour so its well coated.\n Heat 2 tablespoons of the oil with the butter in a large flameproof casserole dish or deep ovenproof sauté pan.\n\nTip in the lamb and fry over a high heat for 5 minutes turning over occasionally, until no longer pink and starting to brown.\n Transfer to a plate with a slotted spoon.\n\nAdd the onion to the dish or pan with another tablespoon of oil if needed, and fry over a medium-high heat for 5 minutes,\nor until just starting to brown, stirring occasionally.\nStir in the garlic and cook 1 minute, then the tomato purée and keep stirring for about 30 seconds.\n Pour in a little of the stock and scrape the bottom of the pan to deglaze it.\nSlowly add the rest of the stock, stirring all the time.\n\nReturn the lamb to the pan along with the carrots, potato and herb sprigs. Cover and bake in the oven for 13/4 hours.\nTaste and adjust seasoning as needed.\nJust before the lamb has been cooking for 13/4 hours, make the dumplings.\nPut the flour in a medium bowl and season with salt and pepper.\n\nAdd the butter and rub together with your fingers to make rough crumbs.\nStir in the rosemary, thyme and parsley, then pour in 2 tablespoons of cold water and mix using a round bladed knife to a softish dough.\nCut the dough into 8 even-sized pieces and gently shape into small balls.\n\nDrop these on the surface of the casserole and cook in the oven, uncovered,\nfor 20 more minutes until the dumplings are risen and the lamb is meltingly tender.\n(For a thinner sauce, carefully stir in a little more stock or boiling water.) Serve scattered with parsley.", 10, 10);
  rect(750,20,80,25);
   fill(0);
   text("< BACK",760,37);
   noStroke();
   fill(255); 
    if((mouseX > 750) && (mouseX < 830) && (mouseY > 20) && (mouseY < 45)){
    if(mousePressed){
      startScreen = true;
      caloriesPage4 = false;
    }
  }
  }
    }
  




