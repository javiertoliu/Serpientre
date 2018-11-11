int x [] = new int [50];
int y [] = new int [50];
int headX, headY, speedX, speedY, speed, delay, i1;
boolean alive, pausa;
                                                                                                                                                                                                       /*
|Setup|                                                                                                                                                                                    */
void setup() {
  size (600, 600);
  noStroke();
    headY = height / 2;
    headX = width / 2;                                                                                                                                                                                                       /*
    |velocidad de sepiente|                                                                                                                                                                                    */
    speed = 15;
    speedX = 15;
    delay = 0;
    for (int i = 1; i < 50; i++) {
      x[i] = -10;
      y[i] = -10;
    }
}
                                                                                                                                                                                                      /*
|Loop|                                                                                                                                                                                    */
void draw() {
  background (0);
  
  
  /*Vivo o muerto (alive)*/
  if (alive != true) {}
/*¨¨(verificacion de choque)*/
    while (alive == true) {
      if (headX != x[i1] && headY != y[i1]) alive = true;
        else alive = false;
      i1++;  
    }
  if (delay == 0) {
    delay++;
    x[0] = headX - speedX;
    y[0] = headY - speedY;
    for (int i = 49;i >= 1; i--) {
      x[i] = x[i-1];
      y[i] = y[i-1];
      ellipse (x[i], y[i], 30, 30);
      text (y[i], 300, 320);
      text (x[i], 300, 330);
    }
    
    headX = headX + speedX;
    headY = headY + speedY;
    
  }
  
  else if (delay == 1) delay++;
  else delay = 0;
    for (int i = 49;i >= 1; i--) ellipse (x[i], y[i], 30, 30);
  ellipse (headX, headY, 30, 30);
  ellipse (x[0], y  [0], 30, 30);
  text (headY, 300, 300);
  text (headX, 300, 310);
}
                                                                                                                                                                                                    /*
|Teclas|                                                                                                                                                                                                            */
void keyPressed() {
  switch (key) {
    /**/case 'w':
        if (speedX != 0) {
          speedY = -speed;
          speedX =  0;
        }
        break;
      /**/case 'a':
          if (speedY != 0) {
            speedX = -speed;
            speedY =  0;
          }
          break;
        /**/case 's':
            if (speedX != 0) {
              speedY =  speed;
              speedX =  0;
            }
            break;
          /**/case 'd':
              if (speedY != 0) {
                speedX =  speed;
                speedY =  0;
              }
              break;
/* * * * * * *  */case 'e':
                    pausa = true;
                  break;
    
  }
}
 
