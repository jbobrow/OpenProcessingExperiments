
AnalogClock analogClock;
PImage train, name1, name2, name3, name4, name5, name6, name7, name8, name9, name10,
name11, name12, name13, name14, name15, name16, name17, name18, name19, name20,
name21, name22, name23, name24, name25, name26, name27, name28, name29;

void setup() {
  size(450, 450);
  smooth();
  analogClock = new AnalogClock(width/2, height/2);
  //画像ファイル設定
  train = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/trains.png?attachauth=ANoY7coljwS1c_FYve0hKennIAYnCTau1kFnCjHHvsyWqfhDhlWZCrpQSFiSP6869I8WmLVjtb70w8WctuIcPxnQ1zSmIAz3Kmsla3EY8J7o34rWst7TIXnydKSwLm-JPgVFlMAjr0ABikJFwYBDyZ4FhRtwGMQg_sLk_j7qSeE0iKK1-_6q4-3SyhSxvZs2LWeRBuUhBFzIaueoYb157xRhLlNaZmyW0w%3D%3D&attredirects=0");
  name1 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/1.png?attachauth=ANoY7co_PVOWy5Ua3ZwK468cnwY4T5GhA4iDNy9d1-cL4T6tsqNuNQ8t_LxokgyWRPZqThNujQ71dx6pUBYzkCXTbBqgMtQUy-dh1aJk36XRLQcz8sIGi2OB59ADk8Ky_X434ahwiOagmFYavh9UyJP3Rsz-fZZ1jSwMhnNLVV8RNNnMtAkWfHk-Zcvxy1fJA7-2BenWs7-P&attredirects=0");
  name2 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/2.png?attachauth=ANoY7cq0V3rO36DkYqejratfousuXBX7F7jArlaJZCo48vVTC1_wI7x1u5oVmOGOZCrZbNgCW1Ql5dRVHG_03GdlqNuKi6SLpYSgSAQuzJUul5kMa8vAMw1jD27qEfT4cNk2CSlyjTZlDVeascJOtxUvfCg-H6GKgQ-TFuE7VWZlaKBHj9tH7UPn8e32Ibd6rdpYu3Zxzp3A&attredirects=0");
  name3 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/3.png?attachauth=ANoY7crYVR5YHnJ6JbIjaOWK2abtosg1GOCkUpT8daD6Ph2qk5yio03JeeQkQ8hk8CTbRCqr1rnAfwvVk0qF4h8UbpBGW2b2CDeM08xid0PoQmQcnf_xq1XSjCUy9T5pQXa9c_hY5cA-BXsSMFVlc9muy40c1Fh03OfAJrQYYy1RWZYuXmnHJ3QW98tnCrf3VQ83sCXDgt2y&attredirects=0");
  name4 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/4.png?attachauth=ANoY7comPkb-zY4rDB4--XSqg7S0r65h08qYr1-sBgSLZP6xMDv8Mi9vUhiLVSxtL4VAmbk-kS5dddbqeZuUb6P_aygAtGZg8zYhYP1FQsGmz834QAzNRPvOEqyeqwA1IF77ohPP0ZF3zGlxVtytiFPRZgoQh9kAQfbYlA6n5jYJtxO_X6X6W_dr8-2LvZsShpm39ehilz_L&attredirects=0");
  name5 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/5.png?attachauth=ANoY7coYUw-sC8NgiaIwzySUkeWbr83-Q0ENPIzGbhfXEHwHusMELVexi95_sZMoYzGtPIxqk6CNPMatuIM2Dd6Zlo1dA8peX-_2TS4qfHk-9P8gZzS3Aile3WS_XhOVEXrEez7_Fn0Zr5Q6spm8cuoRLkMX--GTctEZWybUQD-5TODgYkBW2NoRb7L21eABBqnEQrUIUtTa&attredirects=0");
  name6 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/6.png?attachauth=ANoY7cobhJ5H10X7atY3qjXJ9pin0VlPm9ZE49qT0lcFLRtIzXS2FGi9w-B1SkMWypCEH3YgjsLy8IeJngGrYpvexg96JXKWX0ZD1qVuURm7zo03hzYUd-rPlfvfddkGp8L-wruqj48tF90LdGoE0tskNBsr7GsM0GfdpQHa1NOYfx2hH_doYlpHl-gPEjzfhnRweGO-W27B&attredirects=0");
  name7 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/7.png?attachauth=ANoY7co0TXV4qMJinB4UH-QnOxKQ9Xnjd74ehHWSdaad-UqokAqp5BJRCwRIGZZZ_t8BMZOlLrRrpBwJhMDnueR-fPidq93ZT7N-mYsJLTaXVfk1pAwIQH6TMGn-0B9YNsR3VsiQu8BAMfNxUTJtGiFWKlfS7IYH3ZRYI5W36U9AFvP3XbGqDXHYowNNB3q5MXlkkvtEhS83&attredirects=0");
  name8 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/8.png?attachauth=ANoY7coNXF0jbxbArcbpnvPM2dW9zxBjFm0U-VhB9BVqpkd1HP-morDFjRlxEQB1xUnPrvak5MF8I8L1JpSqKbcjBZaGbl1bI0X-x0P_qlOR5LkdwQIpjds0NP9AYGExw2OSlhQrctUbbedkTAU3GgGiuff4np__lfXP-mFanmRkqj-FGm29UxuIlVlnLydPlLpBf8a63NuT&attredirects=0");
  name9 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/9.png?attachauth=ANoY7cpLeSAUPbxqM-anMUdtICvgXFWjOOX_pHeps_6rk0q8ZPJVkCwqsRv4TMC2Z8VadOWv95emre1j3XaVnkBMk86t7r2gZjbA_06rx086mrIRhLnE4iXOuP4f025TJCffe2YI2uRs8Pj_7FDdj0Qu4zILXczVdqVolhfg2t7ePeHaC22-3POipR19Tn0u4BCw5hdPCJ6f&attredirects=0");
  name10 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/10.png?attachauth=ANoY7cpYyqcKRM4SHfd1iAnxpjj4Y0UfpEHAIOrKxW5HFPsAUwpMM9vYGN6NNTlqyMp8_WSlWXFsbkULaZIPKVQdRovcgjI0fcz2OiuCV0yU1k2o_bLhk7Bdy5vwui8r8n0ikGVznhxKiinH3rmQp-jU4pq-rYWLAYiIoXiarLaTWdqRfPfdm-llqEY5TnEgXsab8v166RMLO2zrxG26M_jCAAmID6mNlg%3D%3D&attredirects=0");
  name11 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/11.png?attachauth=ANoY7coIsZZAJjZhY3SQBqNl48EpgJ2mwiG5O49FAG3Dn0GKiX1np1vnxdhaigkFLddn4wGOeZNhoG6Vw-1CSKrbbqDRLwMPGavYCih5V2ktw6VxAvMNwBHmpjc4k3IazqeNmSG4o-oZDKagjM4lD3qL45NnG1JWGU1uECyGFo36JeUw7zFLnO24vF1krrXyKUpTt1nqsdtUWf584dRWdM3CWtKttoNvGw%3D%3D&attredirects=0");
  name12 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/12.png?attachauth=ANoY7crb5h-yxeHvzgKNVNB5PgLRZ6Dfj-3SHgMY22JrvzFAkAGhhqVfCxV-NnqlMnKWZa_7wnZJVBF8C6W32yUBEHfbY5WNH15JyYfUMEG1EVKD8nwqpl2RQE5YkwnpXIV2T-RyhS9WWTX3WYLxS6dGjjfQew_SWyil9h3fzqw4DT2MANHcJoeSzxjcApVU3PxkdOU-nlf1Tfr1N02DZZKJtlzlK6_THA%3D%3D&attredirects=0");
  name13 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/13.png?attachauth=ANoY7crkpCmiBDFkUh2Uumhp3WFNCpShAQAC-3-IaVcemymtZr0buPSE2UqqmNd2xOiU9xhoRE6FFFTe3ni9NwDb0ZCRcBE9Z3suUNKWAESDaIH7RdpdkGBaG_IcEQKFfV3nUSgopmcs0-q87V92I2Mcw1OB4aCJx15ufRDQx7CKhi1n6yivMnszlNQc1npcbLHGxWEdTOCl1_ITJzykJxjwRIHR9zUXew%3D%3D&attredirects=0");
  name14 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/14.png?attachauth=ANoY7cq92XtosO-vDQOq959lS7W6_89OCLMFmWOQQFZ-zFinn3w_kWhWhruDL9y3um4o8Wv1CH5-ZGTsxCSmK_B48Y_R3PfFm59aCH1no9iu5DvgvnGO5cw7VfY4S6MP163h-DgSvwqe2Uka7w8pMVRzXnNihZgivjcC825dVzlszJe32dmjBhCq33K_s2mZObqjCAgh36YgKyV-O6JwAOCyRHzUGh3Dmg%3D%3D&attredirects=0");
  name15 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/15.png?attachauth=ANoY7cq8ltwYq76_p7FzXT-0uPxfJRxFBL_guiMQo3S3siZYC81IUK8ueXzkCSm4gVMCCQBLlJxwkDXH03Xyl1s9zwV5K_uxvwbu7os1JVKfLcfsFZ7YqQ18cWwb-6eYa2NU5N59k_-h5N6XOSbq1oA7_s5hZ-3SpXJj1YnKFqEGR9G7z9jxfXnyucTB6Rxdz_ODVVSGEHi0mQJenTMUG-MP8OWw3FzLrQ%3D%3D&attredirects=0");
  name16 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/16.png?attachauth=ANoY7cqeiFoi5JtLxo-oE09bsrXqFvK6HVjxprfTSBVGutzOfkt4gmVtWNw3cAU-FzeidZy7I_p87XorMDC6ciSW67ypLX8f9IL8GYVgFrjcOj0Z2zhMdHG3X1JmfXiPbvPvPYiMj3h7AIhj4psNiy85-gPpun__zwdOcVBsIpz0ZESJ6Dc6_l5Qr0HVP7T_bhpS37rEkDwqzP1NuLb36BF5zmciEVnGbQ%3D%3D&attredirects=0");
  name17 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/17.png?attachauth=ANoY7cqCL0pxN2U-74TSDlvAvcYWeEwXCS0bmg-Ds_TAA3cPla8PtYdV0aHav4eFKn2Q7CNHXP4jl3jup-rMo3ZiMseUQqaELL-gQOy391QRRT3yULNhIbq7ZPPAVYyHy6odfM9uoTzhJljDav1u8csBAOGz76WNberJgdTAGbTetkyFgMXvmtAF21xYy4maDGy_nNUqnH6acmu1G-kl56rSQCu0u3IUXw%3D%3D&attredirects=0");
  name18 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/18.png?attachauth=ANoY7cpD_gPNZ19RtjlOESiEFc_M0gCNSj4QfnpI4tXA5CFex_g4BUBpsGht9H8o6dQjCJFWL28CoB9pgm4vnSKy6nlXpPfyCe9NmEdzsVbGeZD6FD8R1yuts2f0hABUrmVKs5y0E9DWS7aY0H9gOm9YClqtcfdcfuvXraAG8HCSTRVqa2WKoLMI0yEUcVvq0KFjH2PmB9KbnnXDuVgJQDEoKmq-D-sHUg%3D%3D&attredirects=0");
  name19 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/19.png?attachauth=ANoY7crvWnGlBcm_C0dWKuXJRJyUYg3vLNdI_f-Yj8632on7hwebh0BF42Lea_3K8g-SGGSSzkW71oWzsctR-Fk6-8Eo6A9ie2PP6caOfjTHbtUbVNaihftAT7_cl0JcqUoRx2l-ATyxo2A_wz29y-bHXNpPxQad8MXx790Qk0kimCnc5mr1RgGbzYhmudrKVqLiSswOSkMSS-70sJmgltz-2SNOlh8mvA%3D%3D&attredirects=0");
  name20 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/20.png?attachauth=ANoY7cpCzmx9vOBlj5T5NbYTopSwVmvc74nDg4GpqXsQObZ9r8wUJ359QMv334j7wDClriMaV9Lbt7DgQTSo9qaxgKyjb2qDdzBgEPNE2GB7uZ6w1c5lUm_WJmFeje2KZPhPzf7xktdSkr9lsly0RCn4oQqXwpqGPU6o3O92qz7mqrjxRALUn3-jA2ph22_gIA-s2x22onQ8gUi3KGpd6L8wUHmDmvLEBg%3D%3D&attredirects=0");
  name21 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/21.png?attachauth=ANoY7cppAPAZBwZRIRk_txC8FweQWITAszH_5pyOeJaov8guMd3z6Dn-l2JrZa1LCyQac_MnTB9M1bvo8q_vodjQIvO7NYGTFDKQ2sBdcRk9tlhMlGi1bcG6WSFY3kR_V_qjm7s9Rm1Boyz5HruAQbRJ6QCO5frzTRD63n4gceEYrxzClq1xRlMxKZtoV8r65ECDtMpx5DtqX6bh9Bvy_cn8dDi2shLm0w%3D%3D&attredirects=0");
  name22 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/22.png?attachauth=ANoY7cqmFGr1OZ495CZucGiJWvjTPZY8bYfdwhXFupyr4OLdQlAzpwLLyoNvJaAj-1PUYZ3FXe59K1IORuC7O7760_qiTV57FcLmwtN5vFo88udhdS9vQGyvfRnrTq2vQKc-C5t1Ueh8ug9lu6R0vtuDgP5ua1H0LYV6I3DU7pV6U-yjWP7lv3ho07ZLiERjLdM3Um1pL1HDLMih5JWTg0JgTHPmYBNrxw%3D%3D&attredirects=0");
  name23 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/23.png?attachauth=ANoY7cqk_Bup_r_r80oDYHPVpf7Ds2-l4zD8qEbP3tGeNhX0M3dFjCCQzF2EO0sBDvD4zYVrWEB-6mJhUIA2oC8todvGHi-b6Pg0U4yp91KfRCQ7ODm9TfGIf6srIIpvJ9K1UYP53htyyBfTFHcu25ssSy1J4EkceCedU9h8o9-Ed85yykgjtfs-2rZoIxX3pkIGVBYymnLMRa0RyI6uVBYEaEC8VvIP5g%3D%3D&attredirects=0");
  name24 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/24.png?attachauth=ANoY7coa7MUd6VU2uva_JqymFGeZIKd37-VNDhjGCnVJ4fiL6Q8XM-aFpY7Ho6dI027ujkZI9-BNS3lmBRFOOBKg7hEpuDJh2WIHShazg5KE-ZPmfBX_wSZEHzFv_1XPSh3GTHN0taXdJHcoArpG56gwqFJeyjQDfVB8iWK3-pPKTyHEjCwm1vsSPbbzs9eSIwVqua5_WPR83q6tlwN6eCSMlD0MCldJ3w%3D%3D&attredirects=0");
  name25 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/25.png?attachauth=ANoY7cq2FqsTDMsDHvHVUKCAVAjSsDrg2NpO-QIS9fFSTTbtLpbZImwRoHKFJwbtppzXs7mmKo-aaseaUuySUxWvN-GYTukHI5IW8xeRHAjJVJhV-rG-r-xHyZNSISaCEINccdwjAeCPUAx3lY7T6vy-jVZyOn1Pvf3jRx1hbTZkKjz0tToPjj0JmFXzvKruCHIBG2tx45ss85-vViSM7tZESdKp3MniNw%3D%3D&attredirects=0");
  name26 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/26.png?attachauth=ANoY7cr6ldzHyV3PAH8CEfFA9RSFHHzNoq7STcxNYhmd8OLy8gpFAerwcGdgKdH5qw7Zxtc3Rh9yQsF9NeP8gSKClesHC4cPbDonpEzVZkUCB_A8UHRcSi0c4WwV-zbt14mFVQUaOqbVl3L7bJgjo3EjzLh_wdlENTSEgGcGL4GZZ80GtZ_fNjzAccvcCg7Jo-cbN0afr_HwoHmanxe5IllV2OzmKjS-KA%3D%3D&attredirects=0");
  name27 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/27.png?attachauth=ANoY7cqP-mTizwfeZ2hkyhIVNvA6Kh2DwDXZxgi8V9SkN93kgHZE1y1r3WJ7dd7ofjXX1eO5jN3inow7GojDnD6jC6A8_hWEG8P1nMyhyBJxEj77gZ5VRXrI_e-jVqPyVZ1n-ZFLHkJsC7ViAg37Tmxp7FYMtFzqzzICKg96silXSvLxgu7txHaMMK96vNvnhOKf3ES3l-0UDVXE0PI8iUwS5fNMxUxlcg%3D%3D&attredirects=0");
  name28 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/28.png?attachauth=ANoY7cqOUhY2BKvQ0kSTMZz1-ws_hZVQtOyV03zIbIn23MP8wBY3NDMpVA_Eeo0TPNqSrt1D0fbUIb3lMM63MAfDHfskaebqzNQlCLvBYpeHfYzzSL4N5d9JgFR2NKhamSMDf5kLSpf1toL7edSUcpWId33kE113RRRT4BbIx_e3GBwIwcz7A-cYQhmntbcrC-eN5cQ0k0cROKdTZEFH1_X_362K3JuyFw%3D%3D&attredirects=0");
  name29 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/29.png?attachauth=ANoY7coDakWWDd7K6f35sxQacybxVxp-ZYGB-C95L7rUuBeWnDnEzhR7FKemc6rvw5W66VPtn9LVNI_X-9gmf3xWjk2UX5pSXC8gwuy6wKvLoN9w0qA2El2gnHLOrI6Bncqpue-yYCXmAT4n1l9QiN_QxrB9MWx6NMUUPX3IHS6n8zk13j63zoFawZqsiJ4CAgf-T1DfAD6NeXoaAYuJYjX9enyV98oxxw%3D%3D&attredirects=0");
}

void draw() {
  background(255);
  analogClock.getTime();
  analogClock.display();
}

class AnalogClock extends Clock {
  float x, y;

  AnalogClock(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void getTime() {
    super.getTime();

  }

  void display() {
    //盤
    println(train.width); //画像の幅をコンソールに表示
    println(train.height); //画像の高さをコンソールに表示
    image(train, (width - train.width) / 2, (height - train.height) / 2);
    
    //時間ごとに駅名を表示
    if(m == 0) image(name1, (width - name1.width) / 2, (height - name1.height) / 2);
    if(m == 2) image(name2, (width - name2.width) / 2, (height - name2.height) / 2);
    if(m == 3) image(name3, (width - name3.width) / 2, (height - name3.height) / 2);
    if(m == 6) image(name4, (width - name4.width) / 2, (height - name4.height) / 2);
    if(m == 9) image(name5, (width - name5.width) / 2, (height - name5.height) / 2);
    if(m == 12) image(name6, (width - name6.width) / 2, (height - name6.height) / 2);
    if(m == 15) image(name7, (width - name7.width) / 2, (height - name7.height) / 2);
    if(m == 17) image(name8, (width - name8.width) / 2, (height - name8.height) / 2);
    if(m == 18) image(name9, (width - name9.width) / 2, (height - name9.height) / 2);
    if(m == 21) image(name10, (width - name10.width) / 2, (height - name10.height) / 2);
    if(m == 23) image(name11, (width - name11.width) / 2, (height - name11.height) / 2);
    if(m == 25) image(name12, (width - name12.width) / 2, (height - name12.height) / 2);
    if(m == 27) image(name13, (width - name13.width) / 2, (height - name13.height) / 2);
    if(m == 30) image(name14, (width - name14.width) / 2, (height - name14.height) / 2);
    if(m == 32) image(name15, (width - name15.width) / 2, (height - name15.height) / 2);
    if(m == 33) image(name16, (width - name16.width) / 2, (height - name16.height) / 2);
    if(m == 36) image(name17, (width - name17.width) / 2, (height - name17.height) / 2);
    if(m == 37) image(name18, (width - name18.width) / 2, (height - name18.height) / 2);
    if(m == 38) image(name19, (width - name19.width) / 2, (height - name19.height) / 2);
    if(m == 40) image(name20, (width - name20.width) / 2, (height - name20.height) / 2);
    if(m == 42) image(name21, (width - name21.width) / 2, (height - name21.height) / 2);
    if(m == 43) image(name22, (width - name22.width) / 2, (height - name22.height) / 2);
    if(m == 45) image(name23, (width - name23.width) / 2, (height - name23.height) / 2);
    if(m == 47) image(name24, (width - name24.width) / 2, (height - name24.height) / 2);
    if(m == 49) image(name25, (width - name25.width) / 2, (height - name25.height) / 2);
    if(m == 51) image(name26, (width - name26.width) / 2, (height - name26.height) / 2);
    if(m == 53) image(name27, (width - name27.width) / 2, (height - name27.height) / 2);
    if(m == 55) image(name28, (width - name28.width) / 2, (height - name28.height) / 2);
    if(m == 57) image(name29, (width - name29.width) / 2, (height - name29.height) / 2);
    
    //針の色
    stroke(0);
    //時
    pushMatrix();
    translate(width/2, height/2);
    rotate((h + m/60.0) % 12 * TWO_PI/12);
    strokeWeight(6);
    line(0, 0, 0, -100);
    popMatrix();
    //分
    pushMatrix();
    translate(width/2, height/2);
    rotate((m + s/60.0) * TWO_PI/60);
    strokeWeight(3);
    line(0, 0, 0, -120);
    popMatrix();
    //秒
    pushMatrix();
    translate(width/2, height/2);
    rotate(s * TWO_PI/60);
    strokeWeight(1);
    line(0, 0, 0, -120);
    popMatrix();
  }
}

class Clock {
  int h, m, s;
  Clock() {
  }

  void getTime() {
    h = hour();
    m = minute();
    s = second();
  }
}
