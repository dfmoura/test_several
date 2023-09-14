//ACQA UNIUBE

#include <stdio.h>
#include <stdlib.h>
#include <locale.h>
int main() {
    setlocale(LC_ALL, "pt_PT.UTF-8");
    int num,num2=0,num3,positivos=0,negativos=0,soma;
    float perPositivo,perNegativo;
    
    while(1){    
        printf("Informe quantos números deverão compor sua lista da números inteiros: ");
        scanf("%d",&num);

        if(num ==0){break;}

        //
        
        int vector[num];
        for (int i = 0; i < num; i++) {
            num2++;
            printf("digite o %d° número de %d: ",num2,num);
            scanf("%d", &num3);
            if(num3>0) positivos++;
            if(num3<0) negativos++;
            soma+=num3;
        }
        perPositivo=(positivos/(positivos+negativos))*100;
        perNegativo=(negativos/(positivos+negativos))*100;
        printf("\nTotal de números positivos:%d, que representa %.2f%% do total de números.\n",positivos,perPositivo);
        printf("Total de números negativos:%d, que representa %.2f%% do total de números.\n",negativos,perNegativo);
        printf("A média aritmética é %.2f.\n",(float)soma/num);

    }
    printf("\n");
    return 0;
}

