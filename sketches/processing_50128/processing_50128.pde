
// Pasword Checker by Mr. Lee on 20/01/2011
// Checks the strength of a password.
// Each circle will light up if it satisfies a password strength condition.

String password = ""; // The password.
boolean hasCapitals = false; // Does the password have capital letters?
boolean hasNumbers = false;  // Does the password contain numbers?
boolean hasSpecialChars = false; // Does the password contain special characters?
boolean inDictionary  = false; // Is the password in the dictionary?
boolean isLong = false; // Is the password longer than 8 characters?
int passwordQuality = 1; // The password quality - should be 0, but since we don't have a inDictionary function, we'll assume the user won't type in a proper word.
int longPassword = 8; // The minimum password length considered strong
int passwordLength = 0; // The length of the password.

void setup() {
//  size(200, 100);
  textAlign(CENTER);  
}

// Draw the circles and the password to the screen.
void draw() {
  // Draw the password.
  background(153);  
  fill(0);
  text(password, width/2, height/2);

  // Draw five circles, depending on the password quality, change the
  // fill colour from white to black.
  if (passwordQuality > 0) {
    fill(255);
  }
  ellipse(width/2 - 24, height/2 + 12, 12, 12);

  if (passwordQuality > 1) {
    fill(255);
  } else {
    fill(0);    
  }
  ellipse(width/2 - 12, height/2 + 12, 12, 12);

  if (passwordQuality > 2) {
    fill(255);
  } else {
    fill(0);
  }
  ellipse(width/2, height/2 + 12, 12, 12);
  if (passwordQuality > 3) {
    fill(255);
  } else {
    fill(0);
  }

  ellipse(width/2 + 12, height/2 + 12, 12, 12);

  if (passwordQuality > 4) {
    fill(255);
  } else {
    fill(0);
  }
  ellipse(width/2 + 24, height/2 + 12, 12, 12);  
}

void keyTyped() {
  // Store the key pressed and increase the password length.
  password = password + String(key);
  passwordLength = passwordLength + 1;
  
  // Test each of the conditions for the password strength. If it 
  // satisfies a condition for the first time, increase the password Quality by 1.
  // Repeat for all 5 conditions.
  if (hasNumbers == false) {
    hasNumbers = ( key >= '0' && key <= '9');
    if (hasNumbers) {
      passwordQuality = passwordQuality + 1;
    }
  }
  if (hasCapitals == false ) {
    hasCapitals = (key >= 'A' && key <= 'Z');
    if (hasCapitals) {
      passwordQuality = passwordQuality + 1;
    }
  }
  if (hasSpecialChars == false) {
  // If it doesn't contain characters and numbers then it is a symbol.
    hasSpecialChars = ( !(key >= '0' && key <= '9') &&  
        !(key >= 'A' && key <= 'Z') &&  
        !(key >= 'a' && key <= 'z'));
    if (hasSpecialChars) {
      passwordQuality = passwordQuality + 1;
    }  
  }
  if (isLong == false) {
    isLong = (passwordLength > longPassword);
    if (isLong) {
      passwordQuality = passwordQuality + 1;
    }
  }
}
                
