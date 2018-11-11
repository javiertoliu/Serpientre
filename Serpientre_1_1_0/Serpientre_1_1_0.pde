PImage manzana, tailA, tailW, tailD, tailS, X, Y, headW, headA, headS, headD, gWD, gAW, gSA, gDS;
int x [] = new int [500];
int y [] = new int [500];
int headX, headY, speedX, speedY, speed, delay, i1, i2, i3 = 1, tails, appleX, appleY, headO;
boolean alive, pausa, appleP, timing = true, created;
                                                                                                                                                                                                                      /*
|Setup|                                                                                                                                                                                    */
void setup() {
  size (600, 600);
  noStroke();
  imageMode (CENTER);
    headY = height / 2;
    headX = width / 2;                                                                                                                                                                                                       /*
    |velocidad de sepiente|                                                                                                                                                                                    */
    speed = 30;
    speedX = 30;
    headO = 3;
    alive = true;
    tails = 4;
      i1 = 1;
    manzana = loadImage ("manzana.png");
    tailA = loadImage ("tailA.png");
    tailW = loadImage ("tailW.png");
    tailD = loadImage ("tailD.png");
    tailS = loadImage ("tailS.png");
    headW = loadImage ("headW.png");
    headA = loadImage ("headA.png");
    headS = loadImage ("headS.png");
    headD = loadImage ("headD.png");
    gWD = loadImage ("gWD.png");
    gAW = loadImage ("gAW.png");
    gSA = loadImage ("gSA.png");
    gDS = loadImage ("gWD.png");
    X = loadImage ("X.png");
    Y = loadImage ("Y.png");
}
                                                                                                                                                                                                      /*
|Loop|                                                                                                                                                                                    */
void draw() {
  if (alive == true) {
    background (0);
 
//AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
  /*Vivo o muerto (alive)*/
    /*(verificacion de choque)*/
      i1 = 499;
    while (i1 > 2 && alive == true) {
      if (headX == x[i1] && headY == y[i1]) alive = false;
        else alive = true;
      i1--; 
    }
//DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
  if (delay == 0) {
    delay++;
    x[0] = headX;
    y[0] = headY;
    headX = headX + speedX;
    headY = headY + speedY;
    for (int i = 499;i >= 1; i--) 
      if (i < tails) {
        x[i] = x[i-1];
        y[i] = y[i-1];
      }  
      timing = true;
  }
  else if (delay == 1) delay++;
  else if (delay == 2) delay++;
  else if (delay == 3) delay++;
  else delay = 0;  

//TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
  while (tails > i3) {
    ellipse (x[i3], y[i3], 30, 30);
    i3++;
  }
    i3 = 1;
    headO (headO, headX, headY);
    ellipse (x[0], y  [0], 30, 30);
    text (headY, 300, 300);
    text (headX, 300, 310);
    text (tails - 4, 300, 320);
//MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
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
  if (appleP == true) {
    image (manzana, appleX, appleY, 30, 30);
    if (headX == appleX && headY == appleY && appleP == true) {
    tails++;
    appleP = false;
  }}
}
  else background (255, 0, 0);
}
     
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           /*
|Teclas|                                                                                                                                                                                                            */
void keyPressed() {
  switch (key) {
    /**/case 'w':
          if (speedX != 0 && timing == true) plus ('w');
        break;
      /**/case 'a':
            if (speedY != 0 && timing == true) plus ('a');
          break;
        /**/case 's':
              if (speedX != 0 && timing == true) plus ('s');
            break;
          /**/case 'd':
                if (speedY != 0 && timing == true) plus ('d');
              break;
/* * * * * * *  */case 'e':
                    pausa();
                  break;
                  case 'o':
                  tails++;
                  break;
    
  }
}

void mousePressed() {
  if (alive == false) {
    
    
    
  }
}

void piece (int x, int y, int i) {
  
}

void pausa() {
  if (pausa == false) {
    noLoop();
  }
  else loop();
}
void plus (char i) {
  switch (i) {
    case 'w':
      speedX = 0;
      timing = false;
      speedY = -speed; 
      headO = 0;
    break;
      case 'a':
        speedY = 0;
        timing = false;
        speedX = -speed; 
        headO = 1;
      break;  
        case 's':
          speedX = 0;
          timing = false;
          speedY = speed; 
          headO = 2;
        break;
          case 'd':
            speedY = 0;
            timing = false;
            speedX = speed; 
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

void menu () {
}
