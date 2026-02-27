#define R 8
int r[R+2];
main()
{
    int i,a,b;
    r[1]=1;
    /*printf ("Reina 1, pos 1 \n"); */
    a=2; r[2]=1;
    /*printf ("Reina 2, pos 1 \n"); */
    while (a > 0)
    {
        if (r[a] > R) /* s'han explorat totes les alternatives d'una reina */
        {
            a--;
            r[a]++;
        }
        else
        {
            b=1;
            for (i=1;i<a;i++)
                b = b && ((r[a] != r[i]) &&
                (r[a] != r[i]+(a-i)) &&
                (r[a] != r[i]+(i-a)));
            if (b)
            { /* s'han explorat totes les reines */
                if (a == R) {
                    psol(r,R);
                    r[a]++;
                }
                else { /* de moment OK, pasem a la seguent reina*/
                    a++;
                    r[a]=1;
                }
            }
            else /* alternativa incorrecta, mirem la seguent */
                r[a]++;
        }
    }
}

psol(int* r,int nr)
{
    int i;
    printf("Sol: ");
    for(i=1;i<=nr;i++) printf("%d ",r[i]);
    printf("\n");
}