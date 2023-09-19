//ACQA UNIUBE

#include <stdio.h>
#include <stdlib.h>
#include <locale.h>
int main() {
    setlocale(LC_ALL, "pt_PT.UTF-8");
    int num,num2=0,num3,positivos=0,negativos=0,soma,multiplo_5=0;
    float perPositivo,perNegativo;
    
    while(1){    

        printf("Aperte 0 e tecle ENTER para sair do programa ou ...\n");
        printf("informe o tamanho da nova lista e tecle ENTER para continuar no programa: ");
        scanf("%d",&num);

        if(num ==0){break;}

        //
        
        //int vector[num];
        for (int i = 0; i < num; i++) {
            num2++;
            printf("digite o %d° número de %d: ",num2,num);
            scanf("%d", &num3);
            if(num3>0) positivos++;
            if(num3<0) negativos++;
            soma+=num3;
            if(num3 % 5 ==0 && num3>0) multiplo_5++;
        }
        perPositivo=(positivos/(positivos+negativos))*100;
        perNegativo=(negativos/(positivos+negativos))*100;
        printf("\nTotal de números positivos: %d, que representa(m) %.2f%% do total de nro.(s).\n",positivos,perPositivo);
        printf("Total de números negativos: %d, que representa(m) %.2f%% do total de nro.(s).\n",negativos,perNegativo);
        printf("A soma total de %d pela quantidade %d, compreende uma média aritmética de %.2f.\n",soma,num,(float)soma/num);
        printf("Total de números positivos que são múltiplos de 5 equivale(m) %d nro.(s).\n",multiplo_5);

    }
    printf("\n");
    return 0;
}

