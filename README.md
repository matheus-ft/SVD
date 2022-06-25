# MS512-P2

## (a) Decomposição SVD para "matrizes RGB"

Implementamos [`svd_img`](https://github.com/matheus-ft/MS512-P2/blob/master/svd_img.m) de forma a receber 2 parâmetros: uma "matriz RGB" `A`, isto é uma matriz $n \times m \times 3$ que representam uma fotografia colorida, e um valor `r` para o posto da matriz que a função retorna.

A função quebra a matriz RGB em seus três "canais" (cores) e aplica a decomposição SVD em cada uma dessas matrizes $n \times m$. Em seguida reduzimos o posto desse canal retirando os menores valores singulares da matriz $\Sigma$ (`S` no código) até que restem apenas `r` valores singulares em sua diagonal

As dimensões de `U` e `V` também são ajustadas e o produto $U \Sigma V^t$ fornece uma matriz com posto `r` que serve de aproximação para o canal em questão.

Aplicando este processo para a matriz que representa cada cor e concatenando seus resultados, obtemos uma nova matriz RGB que representa a mesma imagem de `A` com apenas `r` vetores singulares.

## (b) Aplicando o método sobre a Java

Não, não a linguagem de programação Java, mas a buldogue mais fofa que você vai ver. A [foto da Java](https://github.com/matheus-ft/MS512-P2/blob/master/photos/java.jpg) não é de muita qualidade e apresenta posto 719. Ao rodar o script [`main.m`](https://github.com/matheus-ft/MS512-P2/blob/master/main.m) produzimos 5 images com postos significativamente menores do que a original. Notamos que:

- Com [posto 1](https://github.com/matheus-ft/MS512-P2/blob/master/photos/recovered_r1.png) não é possível identificar nada.

- Com posto [21](https://github.com/matheus-ft/MS512-P2/blob/master/photos/recovered_r21.png) e [51](https://github.com/matheus-ft/MS512-P2/blob/master/photos/recovered_r51.png), porém, já é possível identificá-la, ainda que muito _pixelada_.

- As imagens de posto [101](https://github.com/matheus-ft/MS512-P2/blob/master/photos/recovered_r101.png) e [151](https://github.com/matheus-ft/MS512-P2/blob/master/photos/recovered_r151.png) apresentam melhorias nos detalhes da fotografia, ficando mais nítidas que a anterior.

- Com [posto 201](https://github.com/matheus-ft/MS512-P2/blob/master/photos/recovered_r201.png) é possível considerar que a imagem está recuperada.

O número 201 foi obtido via *trial and error* e não carrega um resultado teórico para sua escolha - porém poderíamos avaliar a contribuição de cada valor singular para a formação da imagem (leitura externa indica que $\sigma_i^2$ representa a variância explicada pelos vetores singulares $u_i$ e $v_i$; quanto maior a variância, maior a contribuição e menos valores singulares subsequentes são necessários para recuperar a imagem) e então procurar um valor ótimo de `r`, se existir.

Para obter os mesmos resultados, basta rodar, da raiz do projeto e dentro do octave CLI, `main`.

