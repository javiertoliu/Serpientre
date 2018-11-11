PImage manzana, menu, copa, pumpkin;
PImage m [] = new PImage [7];
int x [] = new int [1000];  int x2 [] = new int [500];
int y [] = new int [1000];  int y2 [] = new int [500];
int headX, headY, speedX, speedY, speed, speedXc, speedYc, i1, i2, i3, i999, tails, appleX, appleY, c, rainbowMode = 0, cc, estado, record, calabazas, appleState;
int headX2, headY2, speedX2, speedY2, speedXc2, speedYc2, tails2, i12, i22, i32;
float w, v, r, boca, r2;  boolean alive = false; //headX2 == 999999999 es enemigo muerto
                                                                                                                                                                                                                      /*
|Setup|                                                                                                                                                                                    */
void setup() {
  size (600, 650);    background (0); 
  noStroke();    noTint();
  imageMode (CENTER);    colorMode (HSB, 600, 600, 600);
  /*Velocidad de serpiente*/speed = 5;        headX2 = 300; headY2 = 30;    tails2 = 20;    tails = 20;                                                                                                                                                 /*
    [Images]                                                                                                                                                                                                    */
    manzana = loadImage ("manzana.png"); pumpkin = loadImage ("pumpkin.png");copa = loadImage ("copa.png");
    menu = loadImage ("menu.png");
    m[0] = loadImage ("m0.png");  m[1] = loadImage ("m1.png");  m[2] = loadImage ("m2.png");  m[3] = loadImage ("m3.png");
    m[4] = loadImage ("m4.png");  m[5] = loadImage ("m5.png");  m[6] = loadImage ("m6.png");
}
                                                                                                                                                                                                      /*
|Loop|                                                                                                                                                                                    */
void draw() {                                                                                                                                                                                                                        /*
  [Static(EraserAll)]                                                                                                                                                                                        */
  background (0);                                                                                                                                                                                 /*
  [AI] {Player(1)}                                                                                                                                                                                              */
         if (appleY < headY && speedY != speed && alive == false) plus ('w', 1);
    else if (appleX < headX && speedX != speed && alive == false) plus ('a', 1);
    else if (appleY > headY && speedY != -speed && alive == false) plus ('s', 1);
    else if (appleX > headX && speedX != -speed && alive == false) plus ('d', 1);                                                                                                                                                                                  /*
  []    {Enemy(2)}                                                                                                                                                                                        */
         if (appleX < headX2 && speedX2 != speed && headX2 != 999999999) plus ('a', 2);
    else if (appleY < headY2 && speedY2 != speed && headX2 != 999999999) plus ('w', 2);
    else if (appleX > headX2 && speedX2 != -speed && headX2 != 999999999) plus ('d', 2);
    else if (appleY > headY2 && speedY2 != -speed && headX2 != 999999999) plus ('s', 2);                                                                                                                              /*
  [smashedDetector(alive || dead)]    {SmashedWithPlayer(1)}                                                                                                                                                                                */  
  while (tails > i1) {
    if (headX == x[i1] && headY == y[i1] && alive == true) alive = false;
      else if (headX == x[i1] && headY == y[i1] && alive == false) tails = 20;
    if (headX2 == x[i1] && headY2 == y[i1] && headX2 != 999999999) headX2 = 999999999;
      else if (headX2 == x[i1] && headY2 == y[i1] && alive == false) tails2 = 20;
    i1++;
  }   i1 = 1;                                                                                                                                                                                                    /*
  []                                  {SmashedWithEnemy(2)}                                                                                                                                                                                                      */
  while (tails2 > i12) {
    if (headX == x2[i12] && headY == y2[i12] && alive == true) alive = false;
      else if (headX == x2[i12] && headY == y2[i12] && alive == false) tails = 20;
    if (headX2 == x2[i12] && headY2 == y2[i12] && headX2 != 999999999) headX2 = 999999999;
      else if (headX2 == x2[i12] && headY2 == y2[i12] && alive == false) tails2 = 20;
    i12++;
  } i12 = 1;                                                                                                                                                                                   /*
  [Changing movement(values)]  {Player(1)}                                                                                                                                                                                                    */
    x[0] = headX;/*____*/y[0] = headY;
    if (headX % 30 == 0 && headY % 30 == 0) {
      speedX = speedXc;/*____*/speedY = speedYc;
    }
    headX = headX + speedX;/*____*/headY = headY + speedY;
    for (int i = 999;i >= 1; i--) 
      if (i < tails) {
        x[i] = x[i-1];/*____*/y[i] = y[i-1];
      }                                                                                                                                                                                                  /*
    []                          {Enemy(2)}                                                                                                                                                                                        */              
    x2[0] = headX2;/*____*/y2[0] = headY2;
    if (headX2 % 30 == 0 && headY2 % 30 == 0 && headX2 != 999999999) {
      speedX2 = speedXc2;/*____*/speedY2 = speedYc2;
    }
    headX2 = headX2 + speedX2;/*____*/headY2 = headY2 + speedY2;
    for (int i = 499;i >= 1; i--) 
      if (i < tails2) {
        x2[i] = x2[i-1];/*____*/y2[i] = y2[i-1];
      }
//TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
   rect (0, 600, 600, 50);
   image (manzana, 40, 625, 33, 40);
   image (pumpkin, 160, 625, 34, 41);
   image (copa, 260, 625, 45, 45);
   textSize (45);
   fill (c, 255, 255);
   if (alive == true) {
     if (tails / 5 - 4 > record) record = tails / 5 - 4;
     if (record == 0) text ("-", 280, 643);
       else text (record, 275, 643);
     text (calabazas / 5 / 4, 180, 643);
     text ((tails - calabazas) / 5 - 4, 60, 643);
   }
     else {
       text ("-", 60, 643);
       text ("-", 180, 643);
       if (record == 0) text ("-", 275, 643);
         else text (record, 275, 643);
     }
    if (rainbowMode == 1) fill (headX, 600 - headY / 2, 600);
     else if (rainbowMode == 2) fill (cc, 600, v);
     if (cc > 600 && rainbowMode == 2) cc = 0;
      else if (rainbowMode == 2)cc = cc + 3;
    while (tails > i3) {
    w = w - w / tails / 3;    v = v - v / tails / 2;
    if (rainbowMode == 0) fill (c, 600, v);
    ellipse (x[i3], y[i3], w, w);
    i3++;
    
    }
    boca = dist (appleX, appleY, headX, headY);
    if (boca < 120 && estado < 18) estado++;
      else if (boca > 120 && estado != 0) estado--;
      translate (headX, headY);  rotate (r);  
      tint (c, 600, 600);
      image (m[estado/3], 0, 0, 50, 50); 
      rotate(-r);  translate (-headX, -headY);
      while (tails2 > i32 && headX2 != 999999999) {   
    fill (255, 600, 600);
    ellipse (x2[i32], y2[i32], 30, 30);
    i32++;
    
    }
    i3 = 1; i32 = 1; 
    v = 600;
    w = 30;
    noTint();
         
                                                                                                                                                                                                                            /*
    [Manzana]  {Creación de la ubicación, con confirmación} {1}                                                         //#Manzana                                                                                        */
while (appleState == 0) {
  appleX = int (random (1, 19));/*____*/appleY = int (random (1, 19));
  appleX *= 30;/*____*/appleY *=30;
  if (appleX != x[i2] && appleY != y[i2] && appleX != headX && appleY != headY || appleX != x2[i22] && appleY != y2[i22] && appleX != headX2 && appleY != headY2)  appleState = 1;
  if (i2 < tails && appleState == 0) i2++;
    else i2 = 0;
  if (i22 < tails2 && appleState == 0) i22++;
    else i22 = 0;
}
if (tails % 30 == 0 && appleState == 1 && headX2 == 999999999) appleState = int (random(1, 3));
if (appleState == 1) {
  image (manzana, appleX, appleY, 30, 37);
  if (headX == appleX && headY == appleY) {
    tails += 5;
    appleState = 0;
  }
  if (headX2 == appleX && headY2 == appleY) {
    tails2 += 5;
    appleState = 0;
  }
}
if (appleState == 2 && headX2 == 999999999) {
  image (pumpkin, appleX, appleY, 30, 30);
  if (headX == appleX && headY == appleY) {
    tails += 20;
    calabazas += 20;
    appleState = 0;
  }
}                                                                                                                                                                                                            /*       
  [3rd pumpkin]                                                                                                                                                                                                */
  if (calabazas / 5 / 4 >= 3) {
    calabazas -= 20;
    headX2 = appleX;
    headY2 = 30;
  }                                                                                                                                                                                                                        /*
  [limits]    {Player(1)}                                                                                                                                                                                          */
  limites (headX, headY, 1);                                                                                                                                                                              /*
  []          {Enemy(2)}                                                                                                                                                                                    */
  limites (headX2, headY2, 2);                                                                                                                                                                    /*
  [Static(staticDetector)]                                                                                                                                                                                        */
  if (alive == false) image (menu, 300, 300, 600, 600);
  
}
     
                                                                                                                                                                                                                               /*
|Teclas|                                                                                                                                                                                                            */
void keyPressed() {
  switch (key) {
    /**/case 'w':
          if (speedX != 0 && alive == true) plus ('w', 1);
        break;
      /**/case 'a':
            if (speedY != 0 && alive == true) plus ('a', 1);
          break;
        /**/case 's':
              if (speedX != 0 && alive == true) plus ('s', 1);
            break;
          /**/case 'd':
                if (speedY != 0 && alive == true) plus ('d', 1);
              break;
  }
}

void mousePressed() {
  if (alive == false) {
    if (mouseX > 140 && mouseX < 460 && mouseY > 110 && mouseY < 170) {
      alive = true;
      
      i3 = 1;  i1 = 1; i12 = 1;
      tails = 20;
      calabazas = 0;
      for (int i = 999;i >= 1; i--) {
          x[i] = 1000;
          y[i] = 1000;
        } 
      for (int i = 499;i >= 1; i--) {
          x2[i] = 1000;
          y2[i] = 1000;
      } 
    }
    if (mouseX > 85 && mouseX < 200 && mouseY > 205 && mouseY < 263) {
    c = 0;
    rainbowMode = 0;
    }
    if (mouseX > 245 && mouseX < 355 && mouseY > 205 && mouseY < 263) {
      c = 200;
      rainbowMode = 0;
    }
    if (mouseX > 400 && mouseX < 510 && mouseY > 205 && mouseY < 263) {
      c = 400;
      rainbowMode = 0;
    }
    if (mouseX > 85 && mouseX < 200 && mouseY > 390 && mouseY < 450) rainbowMode = 1;
    if (mouseX > 245 && mouseX < 360 && mouseY > 390 && mouseY < 450) rainbowMode = 2;
    if (mouseX > 400 && mouseX < 512 && mouseY > 390 && mouseY < 450) rainbowMode = 3;
  }
  
}

void plus (char i, int t) {
  switch (i) {
    case 'w':  
    if (t == 1) {
      speedXc = 0;  speedYc = -speed;
      r = 4.71239;
      }
        else {
          speedXc2 = 0;  speedYc2 = -speed;
          r2 = 4.71239;
        }
    break;
      case 'a':  
      if (t == 1) {
        speedYc = 0;  speedXc = -speed;
        r = 3.14159;
      }
        else {
          speedYc2 = 0;  speedXc2 = -speed;
          r2 = 4.71239;
        }
      break;  
        case 's':  
        if (t == 1) {
          speedXc = 0;  speedYc = speed; 
          r = 1.5708;
        }
          else {
          speedXc2 = 0;  speedYc2 = speed;
          r2 = 4.71239;
        }
        break;
          case 'd':  
          if (t == 1) {
            speedYc = 0;  speedXc = speed;
            r = 0;
          }
            else {
              speedYc2 = 0;  speedXc2 = speed;
              r2 = 4.71239;
            }
          break; 
  }
}

void limites (int x, int y, int t) {
  if (t == 1) {
         if (x > 600 && calabazas / 5 / 4 < 1) headX = 0;
    else if (x < 0 && calabazas / 5 / 4 < 1) headX = 600;
    else if (y < 0 && calabazas / 5 / 4 < 2) headY = 600;
    else if (y > 600 && calabazas / 5 / 4 < 2) headY = 0;
         if (x > 600 && calabazas / 5 / 4 >= 1) alive = false;
    else if (x < 0 && calabazas / 5 / 4 >= 1) alive = false;
    else if (y < 0 && calabazas / 5 / 4 >= 2) alive = false;
    else if (y > 600 && calabazas / 5 / 4 >= 2) alive = false;
  }
  else if (t == 2 && headX2 != 999999999) {
         if (x > 600 && calabazas / 5 / 4 < 1) headX2 = 0;
    else if (x < 0 && calabazas / 5 / 4 < 1) headX2 = 600;
    else if (y < 0 && calabazas / 5 / 4 < 2) headY2 = 600;
    else if (y > 600 && calabazas / 5 / 4 < 2) headY2 = 0;
         if (x > 600 && calabazas / 5 / 4 >= 1) headX2 = 999999999;
    else if (x < 0 && calabazas / 5 / 4 >= 1) headX2 = 999999999;
    else if (y < 0 && calabazas / 5 / 4 >= 2) headY2 = 999999999;
    else if (y > 600 && calabazas / 5 / 4 >= 2) headY2 = 999999999;
  }
}
