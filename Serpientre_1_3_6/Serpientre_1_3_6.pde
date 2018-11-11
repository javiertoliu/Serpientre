PImage manzana, tailA, tailW, tailD, tailS, X, Y, headW, headA, headS, headD, gWD, gAW, gSA, gDS, menu;
int x [] = new int [500];
int y [] = new int [500];
int headX, headY, speedX, speedY, speed, speedXc, speedYc, i1, i2, i3, i999, tails, appleX, appleY, headO, c, textureMode = 1, rainbowMode = 0, cc;
boolean alive = false, pausa, appleP, created;
float w, v, boca;
                                                                                                                                                                                                                      /*
|Setup|                                                                                                                                                                                    */
void setup() {
  size (600, 600);    background (0);
  noStroke();    noTint();
  imageMode (CENTER);    colorMode (HSB, 600, 600, 600);
  /*Velocidad de serpiente*/speed = 5;
  /*Cantidad de colas de comienzo*/tails = 20;                                                                                                                                                                /*
    [Images]                                                                                                                                                                                                    */
    manzana = loadImage ("manzana.png");
    menu = loadImage ("menu.png");
    tailA = loadImage ("tailA.png");  tailW = loadImage ("tailW.png");  tailD = loadImage ("tailD.png");  tailS = loadImage ("tailS.png");
    headW = loadImage ("headW.png");  headA = loadImage ("headA.png");  headS = loadImage ("headS.png");  headD = loadImage ("headD.png");
    gWD = loadImage ("gWD.png");  gAW = loadImage ("gAW.png");  gSA = loadImage ("gSA.png");  gDS = loadImage ("gWD.png");
    X = loadImage ("X.png");  Y = loadImage ("Y.png");
        image (menu, 300, 300, 600, 600);
}
                                                                                                                                                                                                      /*
|Loop|                                                                                                                                                                                    */
void draw() {
    background (0);
if (pausa == true) point (-1, 0);
    else if (alive == false) {
      setup();
      if (headX == 30 && headY > 30 && headX != 575) plus ('w');
        else if  (headX > 29 && headY == 570 && headX != 575) plus ('a');
            else if (headX == 570 && headY < 570 && headX != 575) plus ('s');
              else if (headX > 29 && headY == 30 && headX != 575) plus ('d');
                else {
                  headX = 570;
                  headY = 30;
                  speedX = 0;
                  speedY = speed;
                }
    }
//AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    /*(verificacion de choque)*/
      i1 = 499;
    while (i1 > 1 && alive == true) {
      if (headX == x[i1] && headY == y[i1]) alive = false;
        else alive = true;
      i1--; 
    }
//DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
    x[0] = headX;
    y[0] = headY;
    if (headX % 30 == 0 && headY % 30 == 0) {
      speedX = speedXc;
      speedY = speedYc;
    }
    headX = headX + speedX;
    headY = headY + speedY;
    for (int i = 499;i >= 1; i--) 
      if (i < tails) {
        x[i] = x[i-1];
        y[i] = y[i-1];
      }  
//TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
   if (textureMode == 2) {
    while (tails > i3) {
      tint (c, 600, 600);
      headO (headO, headX, headY);
      if (i3 % 30 == 0) i999 = i3;
  if (headX == x[i999] && x[i999 + 5] == x[i999]) image (Y, x[i999], y[i3], 30, 30);
  i3++;
   }
   }
  else if (textureMode == 1) {
    if (rainbowMode == 1) fill (headX, 600 - headY / 2, 600);
     else if (rainbowMode == 2) fill (cc, 600, v);
     if (cc > 600 && rainbowMode == 2) cc = 0;
      else if (rainbowMode == 2)cc = cc + 3;
    while (tails > i3) {
    w = w - w / tails / 3;
    v = v - v / tails / 2;
    if (rainbowMode == 0) fill (c, 600, v);
    ellipse (x[i3], y[i3], w, w);
    i3++;
    if (boca < 61)
    text (boca, 300, 300); 
    }
    boca = dist (appleX, appleY, headX, headY);
  }
  fill (255);
    i3 = 1;
    v = 600;
    w = 30;
    text (tails / 5 - 4, 300, 320);
    text (headX, 300, 310);
    text (headY, 300, 330);
//MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
  if (alive == true) {
    while (appleP == false) {
    i2++;
    if (created == false) {
      if (i2 == 499 && created == false) i2 = 1;
      appleX = int (random (1, 19));
      appleY = int (random (1, 19));
      appleX = appleX * 30;
      appleY = appleY * 30;
      created = true;
    }
    if (appleX != x[i2] && appleY != y[i2] && appleX != headX && appleY != headY) appleP = true;
      else created = false;
  }
  noTint();
  if (appleP == true) {
    image (manzana, appleX, appleY, 30, 30);
    if (headX == appleX && headY == appleY && appleP == true) {
    tails = tails + 5;
    appleP = false;
    }
  }
//LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL
  if (headX > 600) headX = 0;
    else if (headX < 0) headX = 600;
      else if (headY > 600) headY = 0;
        else if (headY < 0) headY = 600;
}
  
}
     
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           /*
|Teclas|                                                                                                                                                                                                            */
void keyPressed() {
  switch (key) {
    /**/case 'w':
          if (speedX != 0 && alive == true) plus ('w');
        break;
      /**/case 'a':
            if (speedY != 0 && alive == true) plus ('a');
          break;
        /**/case 's':
              if (speedX != 0 && alive == true) plus ('s');
            break;
          /**/case 'd':
                if (speedY != 0 && alive == true) plus ('d');
              break;
/* * * * * * *  */case 'e':
                    if (pausa == false) pausa = true;
                      else pausa = false; 
                  break;
  }
}

void mousePressed() {
  if (alive == false) {
    if (mouseX > 140 && mouseX < 460 && mouseY > 110 && mouseY < 170) {
      alive = true;
      i3 = 1;
      for (int i = 499;i >= 1; i--) {
          x[i] = 1000;
          y[i] = 1000;
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
    if (mouseX > 85 && mouseX < 270 && mouseY > 300 && mouseY < 350) textureMode = 1;
    if (mouseX > 325 && mouseX < 510 && mouseY > 300 && mouseY < 350) textureMode = 2;
  }
  if (pausa == true) {
  }
  
}

void plus (char i) {
  switch (i) {
    case 'w':
      speedXc = 0;
      speedYc = -speed; 
      headO = 0;
    break;
      case 'a':
        speedYc = 0;
        speedXc = -speed; 
        headO = 1;
      break;  
        case 's':
          speedXc = 0;
          speedYc = speed; 
          headO = 2;
        break;
          case 'd':
            speedYc = 0;
            speedXc = speed; 
            headO = 3;
          break; 
  }
}

void headO(int d, int x, int y) {
  switch (d) {
    case 0:
      image (headW, x, y, 30, 30);
    break;
      case 1:
        image (headA, x, y, 30, 30);
      break;
        case 2:
          image (headS, x, y, 30, 30);
        break;
          case 3:
            image (headD, x, y, 30, 30);
          break;
  }
}
